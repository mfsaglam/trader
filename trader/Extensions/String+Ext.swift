//
//  Extension+String.swift
//  trader
//
//  Created by Fatih Sağlam on 16.06.2022.
//

import Foundation

extension String {
    func changeToPairByUpdatingFirst(second: Field) -> CallPair? {
        for newField in Field.allCases {
            if newField.rawValue == self {
                let newCallPair = CallPair(first: newField, second: second)
                return newCallPair
            }
        }
        return nil
    }
    
    
    func changeToPairByUpdatingSecond(first: Field) -> CallPair? {
        for newField in Field.allCases {
            if newField.rawValue == self {
                let newCallPair = CallPair(first: first, second: newField)
                return newCallPair
            }
        }
        return nil
    }
}
