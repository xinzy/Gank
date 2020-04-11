//
//  Apis.swift
//  Gank
//
//  Created by Yang on 2020/4/8.
//  Copyright © 2020 Xinzy. All rights reserved.
//

fileprivate let BASE_URL = "https://gank.io/api/v2/"
fileprivate let PAGE_SIZE = 10

/// 首页Banner
let API_BANNER = BASE_URL + "banners"

/// 分类 API
///
/// 获取所有分类具体子分类[types]数据
let API_CATEGORY = BASE_URL + "categories/%@"

/// 分类数据 API
let API_CATEGORY_DATA = BASE_URL + "data/category/%@/type/%@/page/%d/count/\(PAGE_SIZE)"

/// 文章详情 API
///
/// 参数 postid
let API_ARTICLE = BASE_URL + "post/%@"

/// 文章评论获取 API
///
/// 参数 postid
let API_ARTICLE_COMMENT = BASE_URL + "post/comments/%@"

/// 本周最热 API
/// hot_type 可接受参数 views（浏览数） | likes（点赞数） | comments（评论数）
/// category 可接受参数 Article | GanHuo | Girl
let API_HOT = BASE_URL + "hot/%@/category/%@/count/\(PAGE_SIZE)"


/// 分类类型
enum CategoryType: String {
    case article = "Article"
    case ganhuo = "GanHuo"
    case girl = "Girl"
}

/// Hot Type
/// 本周热门API使用
enum HotType: String {
    case views      // 浏览数
    case likes      // 点赞数
    case comments   // 评论数
}
