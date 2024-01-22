//
//  APIServiceProtocol.swift
//  PromoSteam
//
//  Created by Anderson Moura on 17/01/24.
//

import Foundation

protocol APIServiceProtocol {
    func fetchCheapSharkDeals(completion: @escaping ([DealElement]?, Error?) -> Void)
}
