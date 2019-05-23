//
//  GetReviewsImp.swift
//  lookingReviews
//
//  Created by Mario Acero on 5/23/19.
//  Copyright © 2019 Mario Acero. All rights reserved.
//

import Foundation

class GetReviewsImp: UseCase, GetReviewsUseCase {
    
    var networkProvider: NetworkProvider
    
    init(provider: NetworkProvider?) {
        guard let netProvider: NetworkProvider = provider else {
            self.networkProvider = NetworkProvider()
            return
        }
        
        self.networkProvider = netProvider
    }
    
    func excute(tourPlace: TourPlaceEntity, filters: Filters, completion: @escaping ResponseClosure<Reviews>) {
        networkProvider.getReviews(tourPlace: tourPlace, filters: filters) { (response) in
            completion(response)
        }
    }
}
