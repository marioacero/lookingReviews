//
//  ListReviewViewModel.swift
//  lookingReviews
//
//  Created by Mario Acero on 5/23/19.
//  Copyright © 2019 Mario Acero. All rights reserved.
//

import Foundation

class ListReviewViewModel {
    
    var useCaseLocator: UseCaseLocator
    var tourPlace: TourPlaceEntity!
    var filters: Filters!
    var currentPage: Int = 0
    
    init(caseLocator: UseCaseLocator? = nil ) {
        
        tourPlace = TourPlace(idCity: AppConstants.city, idPlace: AppConstants.place)
        filters = Filters(count: AppConstants.hitsPerPage,
                          page: currentPage,
                          rating: nil,
                          sortBy: nil,
                          direction: nil)
        guard let locator: UseCaseLocator = caseLocator else {
            self.useCaseLocator = UseCaseLocator()
            return
        }
        self.useCaseLocator = locator
        
    }
    
    func getReviews() {
        guard let useCase: GetReviewsUseCase = useCaseLocator.getUseCase(ofType: GetReviewsUseCase.self) else {
            return
        }
        
        useCase.excute(tourPlace: tourPlace, filters: filters) { (response) in
            switch response {
            case .success(let reviews):
                print(reviews)
            case .failure:
                break
            }
        }
    }
}
