//
//  NetworkProvider.swift
//  lookingReviews
//
//  Created by Mario Acero on 5/23/19.
//  Copyright © 2019 Mario Acero. All rights reserved.
//

import Foundation
import Moya

protocol Network {
    associatedtype T: TargetType
    var provider: MoyaProvider<T> { get }
}

typealias APICustomClosure = (GYGAPI) -> Endpoint

class NetworkProvider: Network {
    
    var provider: MoyaProvider<GYGAPI>
    var mapper: Mapper = Mapper()
    required init(customClosure: APICustomClosure? = nil) {
        provider = MoyaProvider<GYGAPI> (plugins: [NetworkLoggerPlugin(verbose: true)])
    }
    
    func getReviews(tourPlace: TourPlaceEntity, filters: Filters, completion: @escaping ResponseClosure<Reviews>) {
        provider.request(.getReviews(filters: filters, place: tourPlace
        )) { (result) in
            switch result {
            case .success(let response):
                if let reviews: Reviews = self.mapper.mapResponseToReviewsEntity(dataResponse: response.data) {
                    completion(.success(reviews))
                }
                completion(.failure( AppError(message: AppConstants.Errors.errorMapping)))
            case .failure(let error):
                break
            }
        }
    }
}
