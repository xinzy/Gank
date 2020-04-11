//
//  UITableView+.swift
//  Gank
//
//  Created by Yang on 2020/4/10.
//  Copyright © 2020 Xinzy. All rights reserved.
//

import UIKit

extension UITableView {
    
    func gankRegister<T: UITableViewCell>(_ type: T.Type) where T: CellRegister {
        if let nib = T.nib {
            self.register(nib, forCellReuseIdentifier: T.identifier)
        } else {
            self.register(type, forCellReuseIdentifier: T.identifier)
        }
    }
    
    func gankDequeueReusableCell<T: UITableViewCell>(_ indexPath: IndexPath) -> T where T: CellRegister {
        return self.dequeueReusableCell(withIdentifier: T.identifier, for: indexPath) as! T
    }
    
    
}
