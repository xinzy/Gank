//
//  HomeViewController.swift
//  Gank
//
//  Created by Yang on 2020/4/8.
//  Copyright © 2020 Xinzy. All rights reserved.
//

import UIKit
import MBProgressHUD

class HomeViewController: BaseViewController {

    @IBOutlet weak var tableView: UITableView!
   
    private let mBannerView = BannerView(frame: CGRect(x: 0, y: 0, width: screenWidth, height: CGFloat(172)))
    var mData = [Article]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.separatorStyle = .none
        tableView.gankRegister(ArticleTableViewCell.self)
        tableView.dataSource = self
        tableView.delegate = self
        
        mBannerView.delegate = self
        tableView.tableHeaderView = mBannerView
        
        loadHomeBannerData()
        loadHotArticle()
    }
}

// MARK: - 数据请求
extension HomeViewController {
    private func loadHomeBannerData() {
        showProgress()
        loadBanner { [weak self] result in
            self?.hideProgress()
            
            switch result {
            case let .success(banner):
                self?.mBannerView.refreshBanner(banners: banner)
                break
            case .failure:
                break
            }
        }
    }
    
    private func loadHotArticle() {
        loadWeeklyHotArticle(.views, .article) { [weak self] result in
            switch result {
            case let .success(articles):
                self?.mData.removeAll()
                self?.mData += articles
                self?.tableView.reloadData()
                
            case .failure:
                break
            }
        }
    }
}

// MARK: - DataSource And Delegate
extension HomeViewController: BannerViewDelete, UITableViewDataSource, UITableViewDelegate {
    func bannerView(_ bannerView: BannerView, tapIndex: Int, tapBanner: Banner) {
        // TODO: Banner 点击
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let article = mData[indexPath.row]
        let cell = tableView.gankDequeueReusableCell(indexPath) as ArticleTableViewCell
        cell.article = article
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let article = mData[indexPath.row]
        let controller = ArticleDetailViewController()
        controller.articleId = article.artId
        self.navigationController?.pushViewController(controller, animated: true)
    }
}
