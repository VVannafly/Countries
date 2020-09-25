//
//  ErrorMessage.swift
//  Countries
//
//  Created by Dmitriy Chernov on 25.09.2020.
//

import Foundation

enum CError: String, Error {
    case unableToGet = "Unable to get list of countries. Please try again."
    case unableToComplete = "Unable to complete your request. Please check your internet connection."
    case invalidResponse = "Invalid response from the server. Please try again."
    case invalidData = "The data received from the server was invalid. Please try again."
}
