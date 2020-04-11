//
//  GirlTableViewCell.swift
//  Gank
//
//  Created by Yang on 2020/4/10.
//  Copyright © 2020 Xinzy. All rights reserved.
//

import UIKit
import Kingfisher

class GirlTableViewCell: UITableViewCell, CellRegister {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var descLabel: UILabel!
    @IBOutlet weak var girlImageView: UIImageView!
    
    var article: Article? = nil {
        didSet {
            guard let art = article else { return }
            titleLabel.text = "妹纸图 \(art.title)"
            authorLabel.text = art.author
            timeLabel.text = art.displayTime
            descLabel.text = art.desc
            
            guard let imageUrl = art.cover else { return }
            girlImageView.kf.setImage(with: URL(string: imageUrl))
        }
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
