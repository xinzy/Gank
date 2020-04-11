//
//  ApiFunc.swift
//  Gank
//
//  Created by Yang on 2020/4/9.
//  Copyright © 2020 Xinzy. All rights reserved.
//

import HandyJSON
import Alamofire

enum RequestResult<T> {
    case success(result: T)
    case failure
}

typealias RequestCallback<T> = (_ result: RequestResult<T>) -> Void


fileprivate func httpGet<T>(_ url: String, _ type: T.Type, _ callback: @escaping RequestCallback<T>) {
    AF.request(url).responseString { response in
        switch response.result {
        case let .success(content):
            if let result = JSONDeserializer<ApiResult<T>>.deserializeFrom(json: content) {
                if result.isSuccess {
                    callback(.success(result: result.data))
                } else {
                    callback(.failure)
                }
            } else {
                callback(.failure)
            }
        case let .failure(error):
            gankPrint(error)
            callback(.failure)
        }
    }
}

/// 首页banner
func loadBanner(callback: @escaping RequestCallback<Array<Banner>>) {
    
    httpGet(API_BANNER, Array<Banner>.self, callback)
}

/// 分类 API
func loadCategories(_ categoryType: CategoryType, callback: @escaping RequestCallback<Array<Category>>) {
    
    let url = String(format: API_CATEGORY, categoryType.rawValue)
    httpGet(url, Array<Category>.self, callback)
}

/// 本周最热
func loadWeeklyHotArticle(_ hotType: HotType, _ categoryType: CategoryType, callback: @escaping RequestCallback<Array<Article>>) {
    
    let url = String(format: API_HOT, hotType.rawValue, categoryType.rawValue)
    httpGet(url, Array<Article>.self, callback)
}

/// 分类数据
func loadCategoryArticle(_ categoryType: CategoryType, type: String, page: Int, callback: @escaping RequestCallback<Array<Article>>) {
    let url = String(format: API_CATEGORY_DATA, categoryType.rawValue, type, page)
    httpGet(url, Array<Article>.self, callback)
}

/// 文章详情
func loadArticleDetail(_ artId: String, callback: @escaping RequestCallback<ArticleDetail>) {
    
    let url = String(format: API_ARTICLE, artId)
    httpGet(url, ArticleDetail.self, callback)
}
