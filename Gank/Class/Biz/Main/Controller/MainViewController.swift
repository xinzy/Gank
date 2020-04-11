//
//  MainViewController.swift
//  Gank
//
//  Created by Yang on 2020/4/8.
//  Copyright © 2020 Xinzy. All rights reserved.
//

import UIKit

class MainViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tabBar.isTranslucent = false
        
        let categoryController = ArticleViewController()
        let ganhuoCategoryController = ArticleViewController()
        categoryController.categoryType = .article
        ganhuoCategoryController.categoryType = .ganhuo
        
        addChildController(HomeViewController(nibName: "HomeViewController", bundle: nil), title: "首页", image: "home")
        addChildController(categoryController, title: "文章", image: "article")
        addChildController(ganhuoCategoryController, title: "干货", image: "essence")
        addChildController(GirlViewController(nibName: "GirlViewController", bundle: nil), title: "妹纸", image: "girl")
    }

    private func addChildController(_ controller: UIViewController, title: String, image: String) {
        controller.title = title
        
        let navController = BaseNavigationController(rootViewController: controller)
        navController.title = title
        navController.tabBarItem.image = UIImage(named: "tabbar_\(image)_default")
        navController.tabBarItem.selectedImage = UIImage(named: "tabbar_\(image)_selected")
        navController.tabBarItem.setTitleTextAttributes([NSAttributedString.Key.foregroundColor : UIColor(fromHexString: "#525252")], for: .normal)
        navController.tabBarItem.setTitleTextAttributes([NSAttributedString.Key.foregroundColor : UIColor(fromHexString: "#F65859")], for: .selected)
        addChild(navController)
    }
}
