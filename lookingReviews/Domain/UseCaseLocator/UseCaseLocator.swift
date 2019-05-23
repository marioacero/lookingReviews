//
//  UseCaseLocator.swift
//  lookingReviews
//
//  Created by Mario Acero on 5/23/19.
//  Copyright © 2019 Mario Acero. All rights reserved.
//

import Foundation

class UseCaseLocator: BaseUseCaseLocator {
    
    func getUseCase<T>(ofType type: T.Type) -> T? {
        switch String(describing: type) {
        case String(describing: GetReviewsUseCase.self):
            return GetReviewsImp(provider: nil) as? T
        default:
            return nil
        }
    }
}
