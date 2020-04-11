//
//  BaseViewController.swift
//  Gank
//
//  Created by Yang on 2020/4/10.
//  Copyright © 2020 Xinzy. All rights reserved.
//

import UIKit
import MBProgressHUD

class BaseViewController: UIViewController {
    var mProgressHUD: MBProgressHUD? = nil
    
    func showProgress() {
        mProgressHUD = MBProgressHUD.showAdded(to: self.view, animated: true)
    }
    
    func hideProgress() {
        mProgressHUD?.hide(animated: true)
    }
    
}
