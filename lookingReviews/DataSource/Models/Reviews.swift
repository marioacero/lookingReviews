//
//  Reviews.swift
//  lookingReviews
//
//  Created by Mario Acero on 5/23/19.
//  Copyright © 2019 Mario Acero. All rights reserved.
//

import Foundation

struct Reviews: Codable {
    let status: Bool
    let totalReviewsComments: Int
    let data: [Review]
    
    enum CodingKeys: String, CodingKey {
        case status
        case totalReviewsComments = "total_reviews_comments"
        case data
    }
}

struct Review: Codable {
    let reviewID: Int
    let rating: String
    let title: String?
    let message, author: String
    let foreignLanguage: Bool
    let date: String
    let languageCode: String
    let travelerType: String?
    let reviewerName: String
    let reviewerCountry: String
    let reviewerProfilePhoto: String?
    let isAnonymous: Bool
    let firstInitial: String
    
    enum CodingKeys: String, CodingKey {
        case reviewID = "review_id"
        case rating, title, message, author, foreignLanguage, date
        case languageCode
        case travelerType = "traveler_type"
        case reviewerName, reviewerCountry, reviewerProfilePhoto, isAnonymous, firstInitial
    }
}


