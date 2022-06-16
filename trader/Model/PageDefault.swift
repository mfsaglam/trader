//
//  Stock.swift
//  trader
//
//  Created by Fatih Sağlam on 15.06.2022.
//

import Foundation

struct PageDefault: Decodable {
    let mypageDefaults: [MypageDefault]
    let mypage: [Mypage]
}

struct Mypage: Decodable {
    let name, key: String
}

struct MypageDefault: Decodable {
    let cod, gro, tke, def: String
}

struct StockData: Codable {
    let l: [L]
    let z: String
}

struct L: Codable {
    let tke: String
    let clo, pdd, las: String?
}
