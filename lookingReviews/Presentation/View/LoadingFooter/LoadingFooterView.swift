//
//  LoadingFooterView.swift
//  lookingReviews
//
//  Created by Mario Acero on 5/23/19.
//  Copyright © 2019 Mario Acero. All rights reserved.
//

import UIKit

class LoadingFooterView: UIView {
    
    class func instanceFromNib() -> UIView {
        let firstItem: Int = 0
        return UINib(nibName: LoadingFooterView.stringRepresentation, bundle: nil).instantiate(withOwner: nil, options: nil)[firstItem] as! UIView
    }
}
