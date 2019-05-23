//
//  GYGAPI.swift
//  lookingReviews
//
//  Created by Mario Acero on 5/23/19.
//  Copyright © 2019 Mario Acero. All rights reserved.
//

import Foundation
import Moya
import Alamofire

enum GYGAPI {
    case getReviews(filters: Filters, place: TourPlaceEntity)
}

extension GYGAPI: TargetType {
    var baseURL: URL {
        guard let url: URL = URL(string: AppConstants.baseUrl) else{
            fatalError(AppConstants.Errors.baseUrl)
        }
        return url
    }
    
    var path: String {
        switch self {
        case .getReviews( _ , let tour):
            let endPoint = String(format: AppConstants.reviewEnpoint, tour.idCity, tour.idPlace)
            return endPoint
        }
    }
    
    var method: Moya.Method {
        return .get
    }
    
    var task: Task {
        switch self {
        case .getReviews(let filters, _ ):
            let jsonEncoder = JSONEncoder()
            
            do {
                let jsonData = try jsonEncoder.encode(filters)
                if let json: [String:Any] = try JSONSerialization.jsonObject(with: jsonData,
                                                                             options: .allowFragments) as? [String:Any] {
                    return .requestParameters(parameters: json, encoding: URLEncoding.queryString)
                }
            } catch let error as NSError {
                assertionFailure("Somethig went wrong with task, error = \(error.description)")
            }
        }
        return .requestPlain
    }
    
    var sampleData: Data {
        return "".data(using: String.Encoding.utf8)!
    }
    
    var failureData: Data {
        return "{failure data}".data(using: String.Encoding.utf8)!
    }
    
    
    
    var headers: [String : String]? {
        return ["Content-type": "application/json"]
    }
    
    var validationType: ValidationType {
        return .successCodes
    }
}
