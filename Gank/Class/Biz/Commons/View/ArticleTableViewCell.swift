//
//  ArticleTableViewCell.swift
//  Gank
//
//  Created by Yang on 2020/4/9.
//  Copyright © 2020 Xinzy. All rights reserved.
//

import UIKit
import Kingfisher

class ArticleTableViewCell: UITableViewCell, CellRegister {

    @IBOutlet weak var coverImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descLabel: UILabel!
    
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    
    
    var article: Article? {
        didSet {
            guard let art = article else { return }
            titleLabel.text = art.title
            descLabel.text = art.desc
            
            authorLabel.text = art.author
            categoryLabel.text = art.category
            timeLabel.text = art.displayTime
            
            if let cover = art.cover {
                coverImageView.kf.indicatorType = .activity
                coverImageView.kf.setImage(with: URL(string: cover), options: [.onlyLoadFirstFrame])
                coverImageView.isHidden = false
            } else {
                coverImageView.isHidden = true
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.selectionStyle = .none
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
}
