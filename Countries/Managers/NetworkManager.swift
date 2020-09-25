//
//  NetworkManager.swift
//  Countries
//
//  Created by Dmitriy Chernov on 25.09.2020.
//


import UIKit

class NetworkManager {
    static let shared = NetworkManager()
    private let baseURL = "https://restcountries.eu/rest/v2/"
    let cache = NSCache<NSString, NSString>()
    
    private init() {}
    
    func getCountries(completed: @escaping (Result<[CountryList], CError>) -> Void) {
        let endpoint = baseURL + "all"
        
        guard let url = URL(string: endpoint) else {
            completed(.failure(.unableToGet))
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            
            if let _ = error {
                completed(.failure(.unableToComplete))
                return
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completed(.failure(.invalidResponse))
                return
            }
            
            guard let data = data else {
                completed(.failure(.invalidData))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let countries = try decoder.decode([CountryList].self, from: data)
                completed(.success(countries))
            } catch {
                completed(.failure(.invalidData))
            }
        }
        task.resume()
    }
    
    func getCountryInfo(for countryName: String, completed: @escaping (Result<CountryInfo, CError>) -> Void) {
        let endpoint = baseURL + "alpha/\(countryName)"
        
        guard let url = URL(string: endpoint) else {
            completed(.failure(.unableToGet))
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            
            if let _ = error {
                completed(.failure(.unableToComplete))
                return
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completed(.failure(.invalidResponse))
                return
            }
            
            guard let data = data else {
                completed(.failure(.invalidData))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let country = try decoder.decode(CountryInfo.self, from: data)
                completed(.success(country))
            } catch {
                completed(.failure(.invalidData))
            }
        }
        task.resume()
    }
    
}
