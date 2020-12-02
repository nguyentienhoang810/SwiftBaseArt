//
//  MovieListVC.swift
//  SwiftBase_art
//
//  Created by Nguyen Manh Hung on 11/27/20.
//  Copyright © 2020 MacBook. All rights reserved.
//

import UIKit

class MovieListVC: BaseVC {
    @IBOutlet private var tableView: PullTableView!

    var vm: MovieListVM!

    // MARK: - Private properties

    typealias GetListMoviePopularParam = MovieEndpoint.GetListMoviePopularParam

    private var movies: [MovieModel] = []
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
        fetchListMoviePopular()
    }

    // MARK: - Private methods

    private func setupUI() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(aClass: MovieListCell.self)
        tableView.setupRefresh(action: nil)
        tableView.startRefresh = { [weak self] _ in
            guard let self = self else { return }
            self.movieList.page = 1
            self.fetchListMoviePopular()
        }
    }

    private func fetchListMoviePopular() {
        guard !isLoading else { return }
        if getListMoviePopularParam.page == 1 {
            startLoading()
        }
        isLoading = true
        vm.fetchListMoviePopular(param: getListMoviePopularParam)
    }

    // MARK: - Public methods

    func handleGetListMoviePopularSuccess(result: APIResult<MovieListModel>) {
        stopLoading()
        tableView.endLoadMore()
        tableView.endRefreshing()
        switch result {
        case let .success(movieList):
            self.movieList = movieList
            if movieList.page == 1 {
                movies = movieList.results ?? []
            } else {
                movies.append(contentsOf: movieList.results ?? [])
            }
            tableView.reloadData()
        case let .failure(error):
            Alert.present(message: error.localizedDescription, actions: .ok(handler: nil), from: self)
        }
        isLoading = false
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
            fetchListMoviePopular()
        }
    }
}
