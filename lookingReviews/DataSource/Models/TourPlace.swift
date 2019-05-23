//
//  TourPlace.swift
//  lookingReviews
//
//  Created by Mario Acero on 5/23/19.
//  Copyright © 2019 Mario Acero. All rights reserved.
//

import Foundation

protocol TourPlaceEntity {
    var idCity: String { get set }
    var idPlace: String { get set }
}

struct TourPlace: TourPlaceEntity {
    
    var idCity: String
    var idPlace: String
}
