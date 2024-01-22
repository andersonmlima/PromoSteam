//
//  APIClient.swift
//  PromoSteam
//
//  Created by Anderson Moura on 17/01/24.
//

import Foundation

class APIClient: APIServiceProtocol {

    static var baseURL: String {
        return "https://www.cheapshark.com/api/1.0/deals?storeID=1&upperPrice=15"
    }

    public init() {}

    func fetchCheapSharkDeals(completion: @escaping ([DealElement]?, Error?) -> Void) {
        guard let url = URL(string: APIClient.baseURL) else {
            print("URL inválida")
            return
        }

        var request = URLRequest(url: url)
        request.httpMethod = "GET"

        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let error = error {
                print("Erro na requisição: \(error.localizedDescription)")
                completion(nil, error)
                return
            }

            guard let data = data else {
                print("Dados não encontrados")
                completion(nil, APIError.noData)
                return
            }

            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let deals = try decoder.decode([DealElement].self, from: data)
                print("Deals recebidos: \(deals)")
                completion(deals, nil)
            } catch let decodingError as DecodingError {
                print("Erro ao decodificar dados: \(decodingError)")
                completion(nil, decodingError)
            } catch {
                print("Erro desconhecido ao decodificar dados: \(error)")
                completion(nil, error)
            }
        }

        task.resume()
    }
}
