//
//  ArticlesViewController.swift
//  Gank
//
//  Created by Yang on 2020/4/11.
//  Copyright © 2020 Xinzy. All rights reserved.
//

import UIKit

class ArticlesViewController: BaseViewController {
    @IBOutlet weak var tableView: UITableView!
    
    private let mRefreshControl = UIRefreshControl()
    
    private var mPage = 1
    private var isNoMoreData = false
    private var isLoading = false
    private var mArticles = [Article]()
    
    var category: Category!
    var categoryType: CategoryType!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        mRefreshControl.attributedTitle = NSAttributedString(string: "下拉刷新")
        mRefreshControl.addTarget(self, action: #selector(refresh), for: .allEvents)
        tableView.refreshControl = mRefreshControl
        tableView.separatorStyle = .none
        tableView.gankRegister(ArticleTableViewCell.self)
        tableView.dataSource = self
        
        fetchArticle(true)
    }
}

// MARK: - Load Data
extension ArticlesViewController {
    
    private func fetchArticle(_ refresh: Bool = false) {
        if isNoMoreData { return }
        guard !isLoading else { return }
        isLoading = true
        
        let page = refresh ? 1 : mPage
        if refresh && !mRefreshControl.isRefreshing {
            mRefreshControl.beginRefreshing()
            isNoMoreData = false
        }
        
        loadCategoryArticle(categoryType, type: category.type, page: page) { [unowned self] result in
            self.isLoading = false
            if self.mRefreshControl.isRefreshing {
                self.mRefreshControl.endRefreshing()
            }
            
            switch result {
            case .success(let articles):
                if refresh {
                    self.mArticles.removeAll()
                }
                if articles.isEmpty {
                    self.isNoMoreData = true
                    break
                }
                self.mArticles += articles
                self.tableView.reloadData()
                self.mPage += 1
                self.tableView.delegate = self
            case .failure:
                break
            }
        }
    }
    
    @objc private func refresh() {
        fetchArticle(true)
    }
}

//MARK: -DataSource And Delegate
extension ArticlesViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        mArticles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let article = mArticles[indexPath.row]
        let cell = tableView.gankDequeueReusableCell(indexPath) as ArticleTableViewCell
        cell.article = article
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let article = mArticles[indexPath.row]
        let controller = ArticleDetailViewController()
        controller.articleId = article.artId
        navigationController?.pushViewController(controller, animated: true)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView.contentSize.height - scrollView.contentOffset.y - scrollView.frame.height <= 0 {
            fetchArticle()
        }
    }
}
