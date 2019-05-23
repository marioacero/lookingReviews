//
//  GetReviewsUseCase.swift
//  lookingReviews
//
//  Created by Mario Acero on 5/23/19.
//  Copyright © 2019 Mario Acero. All rights reserved.
//

import Foundation

protocol GetReviewsUseCase {
    func excute(tourPlace: TourPlaceEntity, filters: Filters, completion: @escaping ResponseClosure<Reviews>)
}
