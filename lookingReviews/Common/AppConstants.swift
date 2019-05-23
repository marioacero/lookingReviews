//
//  AppConstants.swift
//  lookingReviews
//
//  Created by Mario Acero on 5/23/19.
//  Copyright © 2019 Mario Acero. All rights reserved.
//

import Foundation

struct AppConstants {
    
    static let baseUrl: String = "https://www.getyourguide.com/"
    static let reviewEnpoint: String = "%@/%@/reviews.json"
    
    struct Errors {
        static let baseUrl: String = "baseURL could not be configured."
        static let errorMapping: String = "Error Mapping"
    }
    
    static let city: String = "berlin-l17"
    static let place: String = "tempelhof-2-hour-airport-history-tour-berlin-airlift-more-t23776"
    
    static let hitsPerPage: Int = 10
}
