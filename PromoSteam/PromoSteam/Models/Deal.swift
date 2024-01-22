//
//  Deal.swift
//  PromoSteam
//
//  Created by Anderson Moura on 17/01/24.
//

import Foundation

struct DealElement: Codable {
    var internalName, title, metacriticLink, dealID: String?
    var storeID, gameID, salePrice, normalPrice: String?
    var isOnSale, savings, metacriticScore: String?
    var steamRatingText: SteamRatingText?
    var steamRatingPercent, steamRatingCount, steamAppID: String?
    var releaseDate, lastChange: Int?
    var dealRating: String?
    var thumb: String?
}

enum SteamRatingText: String, Codable {
    case mixed = "Mixed"
    case mostlyPositive = "Mostly Positive"
    case overwhelminglyPositive = "Overwhelmingly Positive"
    case veryPositive = "Very Positive"
    case mostlyNegative = "Mostly Negative"
    case unknown = "Unknown"
}

typealias Deal = [DealElement]
