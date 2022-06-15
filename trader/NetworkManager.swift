//
//  NetworkManager.swift
//  trader
//
//  Created by Fatih Sağlam on 15.06.2022.
//

import UIKit

class NetworkManager {
    static let shared = NetworkManager()
    private let stockListUrl = "https://sui7963dq6.execute-api.eu-central-1.amazonaws.com/default/ForeksMobileInterviewSettings"
    private let stockDataUrl = "https://sui7963dq6.execute-api.eu-central-1.amazonaws.com/default/ForeksMobileInterview?fields=pdd,las&stcs=GARAN.E.BIST~ XU100.I.BIST"
    
    private init() { }
    
    func getStockList(completionHandler: @escaping (Result<Stock, TRError>) -> Void) {
        
        guard let url = URL(string: stockListUrl) else {
            completionHandler(.failure(.invalidUrl))
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let _ = error {
                completionHandler(.failure(.unableToComplete))
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completionHandler(.failure(.invalidResponse))
                return
            }
            
            guard let data = data else {
                completionHandler(.failure(.invalidData))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let stockList = try decoder.decode(Stock.self, from: data)
                completionHandler(.success(stockList))
            } catch {
                completionHandler(.failure(.invalidData))
            }
        }
        
        task.resume()
    }
}
