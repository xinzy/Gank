//
//  ArticleViewController.swift
//  Gank
//
//  Created by Yang on 2020/4/8.
//  Copyright © 2020 Xinzy. All rights reserved.
//

import UIKit
import Pageboy
import Tabman
import MBProgressHUD

class ArticleViewController: TabmanViewController {

    private var mProgressHUD: MBProgressHUD? = nil
    
    private var mCategories: [Category]? = nil
    private var mViewControllers = [Int : UIViewController]()
    
    var categoryType: CategoryType!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fetchCategories()
    }
}

// MARK: - Load Data
extension ArticleViewController {
    
    private func fetchCategories() {
        
        mProgressHUD = MBProgressHUD.showAdded(to: self.view, animated: true)
        loadCategories(categoryType) { [unowned self] result in
            self.mProgressHUD?.hide(animated: true)
            
            switch result {
            case .success(let categories):
                self.mCategories = categories
                self.displayTabs()
                break
            case .failure:
                break
            }
        }
    }

    private func displayTabs() {
        
        dataSource = self
        let bar = TMBar.ButtonBar()
        bar.indicator.tintColor = UIColor(fromHexString: "#F65859")
        bar.layout.transitionStyle = .snap
        bar.layout.contentInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
        bar.buttons.customize { btn in
            btn.font = UIFont.systemFont(ofSize: 16)
            btn.tintColor = UIColor(fromHexString: "#525252")
            btn.selectedTintColor = UIColor(fromHexString: "#F65859")
        }
        
        addBar(bar, dataSource: self, at: .top)
    }
}

// MARK: - DataSource
extension ArticleViewController: PageboyViewControllerDataSource, TMBarDataSource {
    func barItem(for bar: TMBar, at index: Int) -> TMBarItemable {
        let cat = mCategories![index]
        return TMBarItem(title: cat.title)
    }
    
    func numberOfViewControllers(in pageboyViewController: PageboyViewController) -> Int {
        mCategories?.count ?? 0
    }
    
    func viewController(for pageboyViewController: PageboyViewController, at index: PageboyViewController.PageIndex) -> UIViewController? {
        
        if let controller = mViewControllers[index] {
            return controller
        } else {
            let controller = ArticlesViewController()
            controller.category = mCategories![index]
            controller.categoryType = categoryType
            mViewControllers[index] = controller
            return controller
        }
    }
    
    func defaultPage(for pageboyViewController: PageboyViewController) -> PageboyViewController.Page? {
        nil
    }
    
    
}
