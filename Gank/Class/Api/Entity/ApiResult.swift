//
//  ApiResult.swift
//  Gank
//
//  Created by Yang on 2020/4/9.
//  Copyright © 2020 Xinzy. All rights reserved.
//

import HandyJSON

struct ApiResult<T>: HandyJSON {
    var data: T!
    var status: Int = 0
    var page: Int = 0
    var pageCount: Int = 0
    var totalCount: Int = 0
    
    var isSuccess: Bool {
        status == 100
    }
    
    mutating func mapping(mapper: HelpingMapper) {
        mapper.specify(property: &pageCount, name: "page_count")
        mapper.specify(property: &totalCount, name: "total_counts")
    }
}
