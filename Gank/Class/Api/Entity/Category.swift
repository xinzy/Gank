//
//  Category.swift
//  Gank
//
//  Created by Yang on 2020/4/9.
//  Copyright © 2020 Xinzy. All rights reserved.
//

import HandyJSON

struct Category: HandyJSON {
    var catId: String = ""
    var coverImageUrl: String = ""
    var desc: String = ""
    var title: String = ""
    var type: String = ""
    
    mutating func mapping(mapper: HelpingMapper) {
        mapper.specify(property: &catId, name: "_id")
    }
}
