//
//  MovieListVC.swift
//  SwiftBase_art
//
//  Created by Nguyen Manh Hung on 11/27/20.
//  Copyright © 2020 MacBook. All rights reserved.
//

import Combine
import UIKit

class MovieListVC: BaseVC {
    @IBOutlet private var tableView: PullTableView!

    var vm: MovieListVM!

    // MARK: - Private properties

    typealias GetListMoviePopularParam = MovieEndpoint.GetListMoviePopularParam

    private lazy var getListMoviePopular = CurrentValueSubject<GetListMoviePopularParam, Never>(getListMoviePopularParam)
    private var movies: [MovieModel] = []
    private var cancellables = Set<AnyCancellable>()
    private var isLoading = false
    private var movieList = MovieListModel()

    private var isEndLoadmore: Bool {
        return movieList.getPage() >= movieList.getTotalPages()
    }

    private var getListMoviePopularParam: GetListMoviePopularParam {
        return GetListMoviePopularParam(page: self.movieList.getPage())
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupData()
    }

    // MARK: - Private methods

    private func setupUI() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(aClass: MovieListCell.self)
    }

    private func setupData() {
        let getListMoviePopular = self.getListMoviePopular
            .filter { [weak self] _ in
                guard let self = self else { return false }
                if !self.isLoading {
                    self.isLoading = true
                    return true
                }
                return false
            }
            .handleEvents(receiveOutput: { [weak self] param in
                guard let self = self else { return }
                if param.page == 1 {
                    self.startLoading()
                }
            })
            .eraseToAnyPublisher()

        let input = MovieListVM.Input(getListMoviePopular: getListMoviePopular)
        let output = vm.transform(input: input)

        output.getListMoviePopularSuccess.sink(receiveCompletion: { [weak self] result in
            guard let self = self else { return }
            self.stopLoading()
            self.tableView.endLoadMore()
            self.tableView.endRefreshing()
            self.handleCallAPICompletion(result)
        }, receiveValue: { [weak self] movieList in
            guard let self = self else { return }
            self.handleGetListMoviePopularSuccess(movieList: movieList)
        })
            .store(in: &cancellables)
    }

    private func handleGetListMoviePopularSuccess(movieList: MovieListModel) {
        stopLoading()
        tableView.endLoadMore()
        tableView.endRefreshing()
        self.movieList = movieList
        movies.append(contentsOf: movieList.results ?? [])
        tableView.reloadData()
        isLoading = false
    }

    private func handleCallAPICompletion(_ result: Subscribers.Completion<APIError>) {
        switch result {
        case let .failure(error):
            Alert.present(message: error.localizedDescription, actions: [.ok(handler: nil)], from: self)
        default:
            break
        }
    }
}

extension MovieListVC: UITableViewDataSource, UITableViewDelegate {
    // MARK: - UITableViewDataSource

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeue(aClass: MovieListCell.self, for: indexPath)
        cell.setContent(movie: movies[indexPath.row])
        return cell
    }

    // MARK: - UITableViewDelegate

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }

    // MARK: - UIScrollViewDelegate

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        tableView.updatePositionLoadmoreView()
        if scrollView.isNearBottomEdge() && !isEndLoadmore {
            tableView.startLoadMore()
            movieList.page = movieList.getNextPage()
            getListMoviePopular.send(getListMoviePopularParam)
        }
    }
}
