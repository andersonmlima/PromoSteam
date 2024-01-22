//
//  HomeViewModel.swift
//  PromoSteam
//
//  Created by Anderson Moura on 17/01/24.
//

import Foundation

class HomeViewModel {
    private var deals: [DealElement]?

    var dealCount: Int {
        return deals?.count ?? 0
    }
    
    func numberOfDeals() -> Int {
            return deals?.count ?? 0
        }

    func deal(at index: Int) -> DealElement? {
        guard let dealElements = deals, index < dealElements.count else {
            return nil
        }
        return dealElements[index]
    }

    func fetchCheapSharkDeals(completion: @escaping ([DealElement]?, Error?) -> Void) {
        let apiClient = APIClient()
        apiClient.fetchCheapSharkDeals { (deals, error) in
            self.deals = deals
            completion(deals, error)
        }
    }
}
