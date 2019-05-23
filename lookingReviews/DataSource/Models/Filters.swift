//
//  Filters.swift
//  lookingReviews
//
//  Created by Mario Acero on 5/23/19.
//  Copyright © 2019 Mario Acero. All rights reserved.
//

import Foundation

struct Filters: Encodable {
    var count: Int
    var page: Int
    var rating: Int?
    var sortBy: String?
    var direction: String?
}
