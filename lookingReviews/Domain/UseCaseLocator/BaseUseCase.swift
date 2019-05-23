//
//  BaseUseCase.swift
//  lookingReviews
//
//  Created by Mario Acero on 5/23/19.
//  Copyright © 2019 Mario Acero. All rights reserved.
//

import Foundation

protocol BaseUseCaseLocator {
    func getUseCase<T>(ofType type: T.Type) -> T?
}


protocol UseCase {}
