//
//  HttpTest.swift
//  GankTests
//
//  Created by Yang on 2020/4/9.
//  Copyright © 2020 Xinzy. All rights reserved.
//

import XCTest
@testable import Gank
import Alamofire

class HttpTest: XCTestCase {

    let url = "https://gank.io/api/v2/banners"
    
    func testGetString() throws {
        AF.request(url).responseString { (response) in
            print(response)
        }
    }
    
    func testGetJson() throws {
        AF.request(url).responseJSON { (response) in
            print(response)
        }
    }
    
}
