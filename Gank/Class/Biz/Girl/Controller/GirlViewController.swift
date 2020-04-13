//
//  GirlViewController.swift
//  Gank
//
//  Created by Yang on 2020/4/8.
//  Copyright © 2020 Xinzy. All rights reserved.
//

import UIKit
import Toast_Swift

class GirlViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    private let mRefreshControl = UIRefreshControl()
    
    private var mPage: Int = 1
    private var mData = [Article]()
    private var isLoading = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.estimatedRowHeight = 211
        tableView.separatorStyle = .none
        tableView.gankRegister(GirlTableViewCell.self)
        tableView.dataSource = self
        tableView.delegate = self
        
        mRefreshControl.tintColor = .gray
        mRefreshControl.attributedTitle = NSAttributedString(string: "下拉刷新")
        mRefreshControl.addTarget(self, action: #selector(refreshData), for: .valueChanged)
        tableView.refreshControl = mRefreshControl
        
        loadData(true)
    }
}

// MARK: - 数据加载
extension GirlViewController {
    
    private func loadData(_ refresh: Bool = false) {
        guard !isLoading else { return }
        isLoading = true
        let page = refresh ? 1 : mPage
        if page == 1 && !mRefreshControl.isRefreshing {
            mRefreshControl.beginRefreshing()
        }
        loadCategoryArticle(CategoryType.girl, type: "Girl", page: page) { [weak self] result in
            
            if self?.mRefreshControl.isRefreshing == true {
                self?.mRefreshControl.endRefreshing()
            }
            self?.isLoading = false
            switch result {
            case let .success(data):
                if page == 1 {
                    self?.mData.removeAll()
                }
                self?.mData += data
                self?.tableView.reloadData()
                self?.mPage = page + 1
            case .failure:
                self?.view.makeToast("加载失败...")
                break
            }
        }
    }
    
    @objc private func refreshData() {
        loadData(true)
    }
}

// MARK: - TableView DataSource And Delegate
extension GirlViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        mData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = mData[indexPath.row]
        let cell = tableView.gankDequeueReusableCell(indexPath) as GirlTableViewCell
        cell.article = item
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let article = mData[indexPath.row]
        let controller = GirlShowViewController()
        controller.girlArticle = article
        controller.modalPresentationStyle = .fullScreen
        present(controller, animated: true, completion: nil)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView.contentSize.height - scrollView.contentOffset.y - scrollView.frame.height <= 0 {
            loadData()
        }
    }
}
