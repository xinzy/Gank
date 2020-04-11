//
//  ArticleDetailViewController.swift
//  Gank
//
//  Created by Yang on 2020/4/10.
//  Copyright © 2020 Xinzy. All rights reserved.
//

import UIKit
import WebKit
import Toast_Swift

class ArticleDetailViewController: BaseViewController {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    
    @IBOutlet weak var viewBtn: UIButton!
    @IBOutlet weak var likeBtn: UIButton!
    @IBOutlet weak var commentBtn: UIButton!
    
    @IBOutlet weak var webView: WKWebView!
    
    private var mArticleDetail: ArticleDetail? = nil
   
    var articleId: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "文章详情"
        
        fetchArticleDetail()
    }
}

extension ArticleDetailViewController {
    
    private func fetchArticleDetail() {
        showProgress()
        
        loadArticleDetail(self.articleId) { [weak self] result in
            
            self?.hideProgress()
            
            switch result {
            case let .success(detail):
                self?.mArticleDetail = detail
                self?.showData()
            case .failure:
//                self?.view.showToas
                break
            }
        }
    }
    
    private func showData() {
        guard let detail = mArticleDetail else { return }
        titleLabel.text = detail.title
        authorLabel.text = detail.author
        timeLabel.text = detail.displayTime
        
        viewBtn.setTitle(String(detail.views), for: .normal)
        likeBtn.setTitle(String(detail.likeCounts), for: .normal)
        commentBtn.setTitle(String(detail.stars), for: .normal)
        
        webView.loadHTMLString(formatH5(detail.content), baseURL: nil)
    }
}
