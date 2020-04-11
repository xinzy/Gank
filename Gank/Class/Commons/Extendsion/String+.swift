//
//  String+Extendsion.swift
//  Gank
//
//  Created by Yang on 2020/4/8.
//  Copyright © 2020 Xinzy. All rights reserved.
//

import Foundation

extension String {
    
    subscript(range: ClosedRange<Int>) -> String {
        return substring(start: range.first ?? 0, end: range.last ?? self.count)
    }
    
    subscript(range: Range<Int>) -> String {
        return substring(start: range.first ?? 0, end: range.last ?? self.count)
    }
    
    subscript(index: Int) -> Character {
        return self[self.index(self.startIndex, offsetBy: 1)]
    }
    
    func substring(start: Int, end: Int? = nil) -> String {
        if start >= self.count || start < 0 || (end != nil && end! <= start) {
            return ""
        }
        
        let startIndex = start == 0 ? self.startIndex : self.index(self.startIndex, offsetBy: start)
        guard let rawEnd = end else {
            return String(self[startIndex ..< self.endIndex])
        }
        let endIndex = rawEnd > self.count ? self.endIndex : self.index(self.startIndex, offsetBy: rawEnd)
        
        return String(self[startIndex ..< endIndex])
    }
    
    func substring(start: Int, count: Int) -> String {
        if start >= self.count || start < 0 || count <= 0 {
            return ""
        }
        let startIndex = start == 0 ? self.startIndex : self.index(self.startIndex, offsetBy: start)
        let endIndex = start + count > self.count ? self.endIndex : self.index(startIndex, offsetBy: count)
        
        return String(self[startIndex ..< endIndex])
    }
}
