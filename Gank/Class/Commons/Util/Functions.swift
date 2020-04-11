//
//  Functions.swift
//  Gank
//
//  Created by Yang on 2020/4/8.
//  Copyright © 2020 Xinzy. All rights reserved.
//

import Foundation
import UIKit

func gankPrint(_ msg: Any..., file: NSString = #file, fun: String = #function, line: Int = #line) {
    #if DEBUG
    debugPrint(file.lastPathComponent, fun, line, msg)
    #else
    print(file.lastPathComponent, fun, line, msg)
    #endif
}

/// 设备边框
func mainBounds() -> CGRect {
    UIScreen.main.bounds
}

/// 设备高度
var screenWidth: CGFloat {
    mainBounds().size.width
}

/// 设备宽度
var screenHeight: CGFloat {
    mainBounds().size.height
}

/// 是否是全面屏设备
var isFullScreen: Bool {
    if #available(iOS 11, *) {
        guard let window = UIApplication.shared.keyWindow else {
            return false
        }
        return window.safeAreaInsets.bottom > 0
    }
    return false
}

func string2date(_ string: String) -> Date? {
    let dateFormat = DateFormatter()
    dateFormat.dateFormat = "YYYY-MM-dd HH:mm:ss"
    return dateFormat.date(from: string)
}

func dateFormat(_ string: String) -> String {
    let dateFormat = DateFormatter()
    dateFormat.dateFormat = "YYYY-MM-dd HH:mm:ss"
    guard let date = dateFormat.date(from: string) else { return "" }
    
    let delta = Date().timeIntervalSince1970 - date.timeIntervalSince1970
    if delta < 60 {
        return "刚刚"
    }
    var time = delta / 60
    if time < 60 {
        return "\(Int(time))分钟前"
    }
    time /= 60
    if time < 24 {
        return "\(Int(time))小时前"
    }
    time /= 24
    if time < 30 {
        return "\(Int(time))天前"
    }
    
    dateFormat.dateFormat = "YY-MM-dd"
    return dateFormat.string(from: date)
}
