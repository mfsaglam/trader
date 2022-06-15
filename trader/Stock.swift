//
//  Stock.swift
//  trader
//
//  Created by Fatih Sağlam on 15.06.2022.
//

import Foundation

struct Stock: Codable {
    let mypageDefaults: [MypageDefault]
    let mypage: [Mypage]
}

struct Mypage: Codable {
    let name, key: String
}

struct MypageDefault: Codable {
    let cod, gro, tke, def: String
}
