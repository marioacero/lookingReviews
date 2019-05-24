//
//  Extensions.swift
//  lookingReviews
//
//  Created by Mario Acero on 5/23/19.
//  Copyright © 2019 Mario Acero. All rights reserved.
//

import Foundation
import UIKit

extension UITableView {
    
    internal func registerNib(_ nibName: String) {
        let cellNib = UINib.init(nibName: nibName, bundle: nil)
        register(cellNib, forCellReuseIdentifier: nibName)
    }
}


extension NSObject {
    
    class var stringRepresentation: String {
        let name = String(describing: self)
        return name
    }
}
