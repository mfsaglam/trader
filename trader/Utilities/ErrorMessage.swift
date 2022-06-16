//
//  ErrorMessage.swift
//  trader
//
//  Created by Fatih Sağlam on 15.06.2022.
//

import Foundation

enum TRError: String, Error {
    case invalidUrl = "The request failed, please contact the developer."
    case unableToComplete = "Unable to complete your request. Please check your internet connection."
    case invalidResponse = "Invalid response from the server. Please try again."
    case invalidData = "The data received from the server was invalid. Please try again."
}
