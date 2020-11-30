//
//  PullTableView.swift
//  SwiftBase_art
//
//  Created by Apple on 11/29/20.
//  Copyright © 2020 MacBook. All rights reserved.
//

import UIKit

class PullTableView: UITableView {
    var refreshControlView: UIRefreshControl!
    var isRefreshing = false
    var loadMoreView: UIView!
    var loadMoreIndicatorView: UIActivityIndicatorView!
    var startRefresh: ((UIRefreshControl) -> Void)?
    var endRefresh: ((UIRefreshControl) -> Void)?
    var bottomInset: CGFloat = 0

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        refreshControlView = UIRefreshControl()
        refreshControlView.addTarget(self, action: #selector(startRefreshing), for: .valueChanged)
        refreshControlView.tintColor = UIColor.systemBlue
        loadMoreView = UIView(frame: CGRect(x: 0, y: 0, width: bounds.width, height: 40))
        loadMoreView.backgroundColor = UIColor.clear
        loadMoreIndicatorView = UIActivityIndicatorView(style: .medium)
        loadMoreIndicatorView.translatesAutoresizingMaskIntoConstraints = false
        loadMoreIndicatorView.color = UIColor.systemBlue
        loadMoreView.addSubview(loadMoreIndicatorView)
        loadMoreIndicatorView.centerXAnchor.constraint(equalTo: loadMoreView.centerXAnchor).isActive = true
        loadMoreIndicatorView.centerYAnchor.constraint(equalTo: loadMoreView.centerYAnchor).isActive = true
        addSubview(loadMoreView)
        endLoadMore()
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        loadMoreView.frame.size.width = bounds.width
    }

    // MARK: - Refresh

    func setupRefresh(action: ((UIRefreshControl) -> Void)?) {
        action?(refreshControlView)
        addSubview(refreshControlView)
    }

    @objc func startRefreshing(_: AnyObject) {
        refreshControlView.beginRefreshing()
        isRefreshing = true
        startRefresh?(refreshControlView)
    }

    func endRefreshing() {
        refreshControlView.endRefreshing()
        isRefreshing = false
        endRefresh?(refreshControlView)
    }

    // MARK: - Loadmore

    func updatePositionLoadmoreView() {
        loadMoreView.frame.origin.y = contentSize.height
    }

    func startLoadMore() {
        DispatchQueue.main.async {
            self.contentInset.bottom = self.bottomInset + 40
            self.loadMoreIndicatorView.startAnimating()
            self.loadMoreView.isHidden = false
        }
    }

    func endLoadMore() {
        DispatchQueue.main.async {
            self.contentInset.bottom = self.bottomInset
            self.loadMoreIndicatorView.stopAnimating()
            self.loadMoreView.isHidden = true
        }
    }
}
