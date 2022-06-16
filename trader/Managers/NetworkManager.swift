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
    private let stockDataBaseUrl = "https://sui7963dq6.execute-api.eu-central-1.amazonaws.com/default/ForeksMobileInterview?"
    
    private init() { }
    
    func getStockList(completionHandler: @escaping (Result<PageDefault, TRError>) -> Void) {
        
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
                let stockList = try decoder.decode(PageDefault.self, from: data)
                completionHandler(.success(stockList))
            } catch {
                completionHandler(.failure(.invalidData))
            }
        }
        
        task.resume()
    }
    
    func updateStockData(tkeList: [String], pair: CallPair, completionHandler: @escaping (Result<StockData, TRError>) -> Void) {
        let stcs = tkeList.joined(separator: "~")
//        let urlString = stockDataBaseUrl + "fields=" + fieldOne + "," + fieldTwo + "&stcs=" + stcs
        let urlString = "\(stockDataBaseUrl)fields=\(pair.first.rawValue),\(pair.second.rawValue)&stcs=\(stcs)"
        
        guard let url = URL(string: urlString) else {
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
                let stockData = try decoder.decode(StockData.self, from: data)
                completionHandler(.success(stockData))
            } catch {
                completionHandler(.failure(.invalidData))
            }
        }
        
        task.resume()
    }
}
