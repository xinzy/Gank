//
//  General.swift
//  Gank
//
//  Created by Yang on 2020/4/10.
//  Copyright © 2020 Xinzy. All rights reserved.
//

import UIKit

protocol CellRegister {
}

extension CellRegister {
    static var identifier: String {
        "\(self)"
    }
    
    static var nib: UINib? {
        return UINib(nibName: Self.identifier, bundle: nil)
    }
}
