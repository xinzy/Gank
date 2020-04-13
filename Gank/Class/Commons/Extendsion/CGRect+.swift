//
//  CGRect+.swift
//  Gank
//
//  Created by Yang on 2020/4/10.
//  Copyright © 2020 Xinzy. All rights reserved.
//

import UIKit

extension CGRect {
    
    var left: CGFloat {
        get {
            origin.x
        }
        set {
            origin.x = newValue
        }
    }
    
    var top: CGFloat {
        get {
            origin.y
        }
        set {
            origin.y = newValue
        }
    }
    
    var right: CGFloat {
        get {
            left + width
        }
        set {
            left = newValue - width
        }
    }
    
    var bottom: CGFloat {
        get {
            top + height
        }
        set {
            top = newValue - height
        }
    }
    
    var height: CGFloat {
        return self.size.height
    }
    
    var width: CGFloat {
        return self.size.width
    }
}
