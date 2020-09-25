//
//  CountryListVC.swift
//  Countries
//
//  Created by Dmitriy Chernov on 25.09.2020.
//

import UIKit

class CountryListVC: UIViewController {

    var countries: [CountryList] = []
    var filteredCountries: [CountryList] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemPink
        getCountries()
    }
    

    func getCountries() {
        //show Loading View
        NetworkManager.shared.getCountries() { [weak self] result in
            
            guard let self = self else { return }
            //dismissLoadingView
            switch result {
            case .success(let countries):
                self.countries.append(contentsOf: countries)
                print(countries)
                
                
            case .failure(let error):
                print(error)
            }
        }
    }

}
