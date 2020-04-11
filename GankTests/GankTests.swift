//
//  GankTests.swift
//  GankTests
//
//  Created by Yang on 2020/4/8.
//  Copyright © 2020 Xinzy. All rights reserved.
//

import XCTest
@testable import Gank
@testable import HandyJSON

class GankTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testDate() throws {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "YYYY-MM-dd HH:mm:ss"
        let date = dateFormatter.date(from: "1970-01-02 00:00:00")
        print(date?.timeIntervalSince1970)
        print(Date().timeIntervalSince1970)
    }


    let jsonArticle: String = """
    {"_id":"5e8c808e31ec89ebfc601f0f","author":"鸢媛","category":"Girl","createdAt":"2020-04-09 08:00:00","desc":"希望你以后喜欢的人，不会让你哭不会让你受委屈不会不理你更不会放弃你最好一直陪着你，保护你最重要的是深深的无可救药的喜欢你。","images":["http://gank.io/images/e831e004436f4fffb657a77aef48b9ca"],"likeCounts":1,"publishedAt":"2020-04-09 08:00:00","stars":1,"title":"第50期","type":"Girl","url":"http://gank.io/images/e831e004436f4fffb657a77aef48b9ca","views":42}
    """
    let jsonArticleResult = """
    {"data":[{"_id":"5e8c808e31ec89ebfc601f0f","author":"\\u9e22\\u5a9b","category":"Girl","createdAt":"2020-04-09 08:00:00","desc":"\\u5e0c\\u671b\\u4f60\\u4ee5\\u540e\\u559c\\u6b22\\u7684\\u4eba\\uff0c\\n\\u4e0d\\u4f1a\\u8ba9\\u4f60\\u54ed\\u4e0d\\u4f1a\\u8ba9\\u4f60\\u53d7\\u59d4\\u5c48\\n\\u4e0d\\u4f1a\\u4e0d\\u7406\\u4f60\\u66f4\\u4e0d\\u4f1a\\u653e\\u5f03\\u4f60\\n\\u6700\\u597d\\u4e00\\u76f4\\u966a\\u7740\\u4f60\\uff0c\\u4fdd\\u62a4\\u4f60\\n\\u6700\\u91cd\\u8981\\u7684\\u662f\\u6df1\\u6df1\\u7684\\u65e0\\u53ef\\u6551\\u836f\\u7684\\u559c\\u6b22\\u4f60\\u3002","images":["http://gank.io/images/e831e004436f4fffb657a77aef48b9ca"],"likeCounts":1,"publishedAt":"2020-04-09 08:00:00","stars":1,"title":"\\u7b2c50\\u671f","type":"Girl","url":"http://gank.io/images/e831e004436f4fffb657a77aef48b9ca","views":42},{"_id":"5e8c808131ec89ebfc601f0e","author":"\\u9e22\\u5a9b","category":"Girl","createdAt":"2020-04-08 08:00:00","desc":"\\u4e0d\\u7ba1\\u4e16\\u754c\\u600e\\u4e48\\u7cdf\\u7cd5\\u90fd\\u597d\\uff0c\\n\\u6211\\u53ea\\u5e0c\\u671b\\u4f60\\u53ef\\u4ee5\\u4e0d\\u8981\\u88ab\\u6253\\u6270\\u5230\\uff0c\\n\\u6211\\u5e0c\\u671b\\u4f60\\u7684\\u8def\\u9014\\u90fd\\u7e41\\u82b1\\u4f3c\\u9526\\uff0c\\n\\u4f60\\u4f9d\\u65e7\\u662f\\u90a3\\u4e2a\\u5341\\u51e0\\u5c81\\u5feb\\u4e50\\u65e0\\u6bd4\\u7684\\u4f60\\u3002","images":["http://gank.io/images/6f1708af33d647f3809ea551e18894ce"],"likeCounts":0,"publishedAt":"2020-04-08 08:00:00","stars":1,"title":"\\u7b2c49\\u671f","type":"Girl","url":"http://gank.io/images/6f1708af33d647f3809ea551e18894ce","views":182},{"_id":"5e8c80682bce50b3ceaa80ea","author":"\\u9e22\\u5a9b","category":"Girl","createdAt":"2020-04-07 08:00:00","desc":"\\u5f53\\u4f60\\u8d8a\\u6765\\u8d8a\\u4f18\\u79c0\\u7684\\u65f6\\u5019\\uff0c\\u5c31\\u4f1a\\u9047\\u89c1\\u8d8a\\u6765\\u8d8a\\u597d\\u7684\\u4eba\\u3002","images":["http://gank.io/images/341ecaacdd7d4cc09cd0de100f3eab46"],"likeCounts":0,"publishedAt":"2020-04-07 08:00:00","stars":1,"title":"\\u7b2c48\\u671f","type":"Girl","url":"http://gank.io/images/341ecaacdd7d4cc09cd0de100f3eab46","views":139},{"_id":"5e8c804c3f6af49cb7780b2b","author":"\\u9e22\\u5a9b","category":"Girl","createdAt":"2020-04-06 08:00:00","desc":"\\u7231\\u5c31\\u662f\\uff0c\\u6211\\u4ee5\\u4e3a\\u6211\\u8981\\u53d8\\u5f97\\u8db3\\u591f\\u597d\\u624d\\u80fd\\u9047\\u89c1\\u4f60\\uff0c\\u5374\\u53d1\\u73b0\\u539f\\u6765\\u662f\\u9047\\u89c1\\u4e86\\u4f60\\uff0c\\u6211\\u624d\\u53d8\\u6210\\u4e00\\u4e2a\\u6700\\u597d\\u7684\\u6211\\u3002","images":["http://gank.io/images/7878d08eb776401a85deeb203372665c"],"likeCounts":0,"publishedAt":"2020-04-06 08:00:00","stars":1,"title":"\\u7b2c47\\u671f","type":"Girl","url":"http://gank.io/images/7878d08eb776401a85deeb203372665c","views":107},{"_id":"5e8745402bce50b3ceaa80dd","author":"\\u9e22\\u5a9b","category":"Girl","createdAt":"2020-04-05 08:00:00","desc":"\\u6708\\u4eae\\u662f\\u6211\\u629b\\u7684\\u786c\\u5e01\\uff0c\\n\\u4e24\\u9762\\u90fd\\u662f\\u60f3\\u89c1\\u4f60 \\u3002","images":["http://gank.io/images/7f64754ca07e4af3a242399fd37c2432"],"likeCounts":0,"publishedAt":"2020-04-05 08:00:00","stars":1,"title":"\\u7b2c46\\u671f","type":"Girl","url":"http://gank.io/images/7f64754ca07e4af3a242399fd37c2432","views":268},{"_id":"5e874524945ed1af2eda88c5","author":"\\u9e22\\u5a9b","category":"Girl","createdAt":"2020-04-04 08:00:00","desc":"\\u51b3\\u5b9a\\u8f6c\\u8eab\\u5c31\\u4e0d\\u8981\\u9891\\u9891\\u56de\\u5934\\uff0c\\u9177\\u7684\\u4eba\\u624d\\u4f1a\\u88ab\\u8bb0\\u5f97\\u4e45\\u4e00\\u4e9b\\u3002 \\u200b\\u200b","images":["http://gank.io/images/cdd7031fa92d40e18a715035b686b4c4"],"likeCounts":0,"publishedAt":"2020-04-04 08:00:00","stars":1,"title":"\\u7b2c45\\u671f","type":"Girl","url":"http://gank.io/images/cdd7031fa92d40e18a715035b686b4c4","views":481},{"_id":"5e87450e945ed1af2eda88c3","author":"\\u9e22\\u5a9b","category":"Girl","createdAt":"2020-04-03 08:00:00","desc":"\\u5982\\u679c\\u90a3\\u4e2a\\u4eba\\u662f\\u771f\\u7684\\u7231\\u4f60\\uff0c\\u4f60\\u8d70\\u4e0d\\u6389\\u7684\\uff0c\\u8dd1\\u4e0d\\u4e86\\u7684\\uff0c\\n\\u9664\\u975e\\u4ed6\\u6709\\u610f\\u653e\\u4f60\\u8d70\\uff0c\\u4f60\\u8fd8\\u6709\\u4ec0\\u4e48\\u4e0d\\u660e\\u767d\\u3002","images":["http://gank.io/images/58389e1189534e1cb75b7a788f6b8a86"],"likeCounts":0,"publishedAt":"2020-04-03 08:00:00","stars":1,"title":"\\u7b2c44\\u671f","type":"Girl","url":"http://gank.io/images/58389e1189534e1cb75b7a788f6b8a86","views":223},{"_id":"5e8200918402c5364e3ac153","author":"\\u9e22\\u5a9b","category":"Girl","createdAt":"2020-04-02 08:00:00","desc":"\\u65f6\\u5149\\u592a\\u7626\\uff0c\\u6307\\u7f1d\\u592a\\u5bbd\\uff0c\\n\\u4e0d\\u7ecf\\u610f\\u7684\\u4e00\\u77a5\\uff0c\\u5df2\\u9694\\u7ecf\\u5e74\\u3002","images":["http://gank.io/images/9770422c45294684af50f725049d7c07"],"likeCounts":1,"publishedAt":"2020-04-02 08:00:00","stars":1,"title":"\\u7b2c43\\u671f","type":"Girl","url":"http://gank.io/images/9770422c45294684af50f725049d7c07","views":255},{"_id":"5e8200698402c5364e3ac152","author":"\\u9e22\\u5a9b","category":"Girl","createdAt":"2020-04-01 08:00:00","desc":"\\u4e0e\\u6211\\u76f8\\u9047\\uff0c\\u662f\\u6b64\\u751f\\u6700\\u7f8e\\u7684\\u98ce\\u666f\\u3002\\n\\u6211\\u7684\\u4e00\\u751f\\u501f\\u4f60\\u4e00\\u7a0b\\uff0c\\n\\u8fd9\\u4e00\\u7a0b\\u4fbf\\u662f\\u4f59\\u751f\\u3002\\n\\u4f60\\u6211\\u4e4b\\u95f4\\u65e0\\u4eba\\u80cc\\u53db\\uff0c\\u671d\\u5915\\u76f8\\u5b89\\u3002","images":["http://gank.io/images/54fc1a56dbc44b52b23714030a457a1b"],"likeCounts":0,"publishedAt":"2020-04-01 08:00:00","stars":1,"title":"\\u7b2c42\\u671f","type":"Girl","url":"http://gank.io/images/54fc1a56dbc44b52b23714030a457a1b","views":494},{"_id":"5e82003ed5b9e4e6b5920fae","author":"\\u9e22\\u5a9b","category":"Girl","createdAt":"2020-03-31 08:00:00","desc":"\\u5feb\\u4e50\\u7684\\u4eba\\u6ca1\\u6709\\u8fc7\\u53bb\\uff0c\\n\\u4e0d\\u5feb\\u4e50\\u7684\\u4eba\\u9664\\u4e86\\u8fc7\\u53bb\\u4e00\\u65e0\\u6240\\u6709\\u3002","images":["http://gank.io/images/0fdac44dada5489b85049a3f3fb7fd85"],"likeCounts":0,"publishedAt":"2020-03-31 08:00:00","stars":1,"title":"\\u7b2c41\\u671f","type":"Girl","url":"http://gank.io/images/0fdac44dada5489b85049a3f3fb7fd85","views":368}],"page":1,"page_count":5,"status":100,"total_counts":50}
    """
    func testJson() throws {
        let articleResult = JSONDeserializer<Article>.deserializeFrom(json: jsonArticle)
        print(articleResult)
        
        let articles = JSONDeserializer<ApiResult<Array<Article>>>.deserializeFrom(json: jsonArticleResult)
        print(articles)
    }
}
