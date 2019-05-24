//
//  ListCustomTableViewCell.swift
//  lookingReviews
//
//  Created by Mario Acero on 5/23/19.
//  Copyright © 2019 Mario Acero. All rights reserved.
//

import UIKit

class ListCustomTableViewCell: UITableViewCell {
    
    @IBOutlet var stars: [UIImageView]!
    @IBOutlet weak var review: UILabel!
    @IBOutlet weak var reviewTitle: UILabel!
    @IBOutlet weak var initials: UIButton!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var reviewDate: UILabel!
    
    let starYellow = UIImage(named: "star")
    let startGray = UIImage(named: "star_gray")
    let initialDefault: String = "A"
    let emptyString = ""
    
    override func awakeFromNib() {
        super.awakeFromNib()
        initials.layer.cornerRadius = initials.frame.width / 2
        initials.clipsToBounds = true
        selectionStyle = .none
    }

    func setCell(item: Review) {
        reviewTitle.text = emptyString
        if let title = item.title {
            reviewTitle.text = title
        }
        
        reviewDate.text = item.date
        review.text = item.message
        name.text = item.reviewerName
        var initial: String = item.firstInitial
        if item.isAnonymous {
            initial = initialDefault
        }
        initials.setTitle(initial, for: .normal)
        
        let ratingInt = (item.rating as NSString).integerValue
        for (index, star) in stars.enumerated() {
            if index < ratingInt {
                star.image = starYellow
                continue
            }
            star.image = startGray
        }
    }
    
}
