//
//  CountryInfo.swift
//  Countries
//
//  Created by Dmitriy Chernov on 25.09.2020.
//

import Foundation

struct CountryInfo: Codable {
    
    let name: String
    let alpha3Code: String
    let region: String
    let population: Int
    var borders: [String?]
    let nativeName: String
    let currencies: [Currency]      //0.currencies[0].name
    var languages: [Language]       //0.languages[0].name
    let flag: String
}

struct Currency: Codable {
    var name: String
}

struct Language: Codable {
    var name: String
    var nativeName: String
}


