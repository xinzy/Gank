//
//  ArtilceDetail.swift
//  Gank
//
//  Created by Yang on 2020/4/10.
//  Copyright © 2020 Xinzy. All rights reserved.
//

import HandyJSON

struct ArticleDetail: HandyJSON {
    var id: String = ""
    var author: String = ""
    var category: String = ""
    var content: String = ""
    var createdAt: String = ""
    var desc: String = ""
    var publishedAt: String = ""
    var title: String = ""
    var type: String = ""
    var updatedAt: String = ""
    var url: String = ""
    
    var markdown: String? = nil
    
    var images: Array<String>!
    var views: Int = 0
    var stars: Int = 0
    var likeCounts: Int = 0
    
    var displayTime: String {
        dateFormat(publishedAt)
    }
    
    mutating func mapping(mapper: HelpingMapper) {
        mapper.specify(property: &id, name: "_id")
    }
}
