//
//  Mapper.swift
//  lookingReviews
//
//  Created by Mario Acero on 5/23/19.
//  Copyright © 2019 Mario Acero. All rights reserved.
//

import Foundation

class Mapper {
    
    func mapResponseToReviewsEntity(dataResponse: Data)-> Reviews? {
        let jsonDecoder: JSONDecoder = JSONDecoder()
        do {
            let entitie: Reviews = try jsonDecoder.decode(Reviews.self, from: dataResponse)
            return entitie
        } catch {
            return nil
        }
    }
    
}
