//
//  ExtendsTests.swift
//  GankTests
//
//  Created by Yang on 2020/4/8.
//  Copyright © 2020 Xinzy. All rights reserved.
//

import XCTest
@testable import Gank

class ExtendsTests: XCTestCase {

    func testSubstring() throws {
        let string = "0123456789"
        
        print(string.substring(start: 1))
        print(string[string.startIndex ..< string.endIndex])
    }
    
}
