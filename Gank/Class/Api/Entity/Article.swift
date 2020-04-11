//
//  Article.swift
//  Gank
//
//  Created by Yang on 2020/4/9.
//  Copyright © 2020 Xinzy. All rights reserved.
//

import HandyJSON

struct Article: HandyJSON {
    var artId: String = ""
    var author: String = ""
    var category: String = ""
    var createdAt: String = ""
    var publishedAt: String = ""
    var desc: String = ""
    var title: String = ""
    var type: String = ""
    var url: String = ""
    
    var images: [String]!
    var likeCounts: Int = 0
    var stars: Int = 0
    var views: Int = 0
    
    var cover: String? {
        images.isEmpty ? nil : images[0]
    }
    
    var displayTime: String {
        dateFormat(publishedAt)
    }
    
    mutating func mapping(mapper: HelpingMapper) {
        mapper.specify(property: &artId, name: "_id")
    }
}
