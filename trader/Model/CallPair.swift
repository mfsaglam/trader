//
//  CallPair.swift
//  trader
//
//  Created by Fatih Sağlam on 16.06.2022.
//

import Foundation

struct CallPair {
    var first: Field
    var second: Field
}

enum Field: String, CaseIterable, Hashable {
    static var allCases: [Field] {
        return [.son, .percentageFark, .fark, .dusuk, .yuksek, .alis, .satis, .ogKap, .tavan, .taban, .grupKodu]
    }
    case son = "las"
    case percentageFark = "pdd"
    case fark = "ddi"
    case dusuk = "low"
    case yuksek = "hig"
    case alis = "buy"
    case satis = "sel"
    case ogKap = "pdc"
    case tavan = "cei"
    case taban = "flo"
    case grupKodu = "gco"
}
