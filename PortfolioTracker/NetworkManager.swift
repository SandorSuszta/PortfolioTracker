//
//  NetworkManager.swift
//  PortfolioTrecker
//
//  Created by Nataliia Shusta on 07/02/2022.
//

import Foundation
import UIKit

class NetworkManager {
    
    static let shared = NetworkManager()
    
    private struct Constants {
        static let endpoint  = ""
    }
    
    public func getMarketData(
        completion: @escaping (Result<[CoinModel], Error>) -> Void
    ) {
        
        guard let url = URL(string: Constants.endpoint) else {
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data , error == nil else { return }
            
                do {
                    let coinArray = try JSONDecoder().decode([CoinModel].self, from: data)
                    completion(.success(coinArray))
                } catch {
                    completion(.failure(error))
            }
        }
        
        task.resume()
    
    }
    
    
}
