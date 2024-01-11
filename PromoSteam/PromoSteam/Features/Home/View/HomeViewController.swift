//
//  HomeViewController.swift
//  PromoSteam
//
//  Created by Anderson Moura on 11/01/24.
//

import UIKit

class HomeViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchCheapSharkDeals()
        
    }
    
    func fetchCheapSharkDeals() {
            // Substitua "YOUR_API_KEY" pela sua chave de API
            let apiKey = "https://api.postman.com/collections/31016053-6a62b2e6-2ce1-4a1b-8a99-4fe5b50963f3?access_key=PMAT-01HKXDSBJHFHZMJWP53EPEC7QZ"
            let apiURL = "https://api.cheapshark.com/1.0/deals?storeID=1&sortBy=Deal%20Rating&pageSize=10&desc=desc&onSale=1"

            guard let url = URL(string: apiURL) else {
                print("URL inválida")
                return
            }

            var request = URLRequest(url: url)
            request.httpMethod = "GET"
            request.addValue(apiKey, forHTTPHeaderField: "X-CheapShark-Token")

            let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
                if let error = error {
                    print("Erro na requisição: \(error.localizedDescription)")
                    return
                }

                guard let data = data else {
                    print("Dados não encontrados")
                    return
                }

                do {
                    if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] {
                        print(json)
                        // Aqui você pode processar os dados JSON conforme necessário
                    }
                } catch {
                    print("Erro ao converter os dados JSON: \(error.localizedDescription)")
                }
            }

            task.resume()
        }
    }
