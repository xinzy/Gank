//
//  GirlShowViewController.swift
//  Gank
//
//  Created by Yang on 2020/4/11.
//  Copyright © 2020 Xinzy. All rights reserved.
//

import UIKit
import Kingfisher

class GirlShowViewController: UIViewController {
    @IBOutlet weak var girlImageView: UIImageView!
    @IBOutlet weak var descLabel: UILabel!
    
    var girlArticle: Article!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        display()
    }

    private func display() {
        title = girlArticle.title
        descLabel.text = girlArticle.desc
        guard let imageUrl = girlArticle.cover else { return }
        girlImageView.kf.setImage(with: URL(string: imageUrl))
    }
}
