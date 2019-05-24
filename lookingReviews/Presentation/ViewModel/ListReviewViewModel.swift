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
    let increasePageConstant: Int = 1
    var dataSource: [Review] = []
    
    // Binding
    var reloadTableView: (()-> Void)?
    var isFooterHidden: ((Bool)-> Void)?
    
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
        
        useCase.excute(tourPlace: tourPlace, filters: filters) {[weak self] (response) in
            guard let strongSelf = self else { return }
            
            switch response {
            case .success(let reviews):
                strongSelf.dataSource.append(contentsOf: reviews.data)
                strongSelf.reloadTableView?()
                if reviews.totalReviewsComments > (strongSelf.filters.count * strongSelf.filters.page + strongSelf.increasePageConstant) {
                    strongSelf.filters.page += strongSelf.increasePageConstant
                }
            case .failure:
                strongSelf.isFooterHidden?(true)
            }
        }
    }
}
