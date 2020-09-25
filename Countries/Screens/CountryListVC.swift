//
//  CountryListVC.swift
//  Countries
//
//  Created by Dmitriy Chernov on 25.09.2020.
//

import UIKit

class CountryListVC: UIViewController {

    var tableView: UITableView!
    
    var countries: [CountryList] = []
    var filteredCountries: [CountryList] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureViewController()
        configureTableView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        getCountries()
    }
    
    
//MARK: - Configuring Controllers
    
    func configureViewController() {
        view.backgroundColor = .systemBackground
        title = "Countries"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    func configureTableView() {
        tableView = UITableView(frame: view.bounds, style: .grouped)
        view.addSubview(tableView)
        
        tableView.frame = view.bounds
        tableView.rowHeight = 40
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(CountryCell.self, forCellReuseIdentifier: CountryCell.reuseId)
    }

    func getCountries() {
        //show Loading View
        NetworkManager.shared.getCountries() { [weak self] result in
            
            guard let self = self else { return }
            //dismissLoadingView
            switch result {
            case .success(let countries):
                self.countries = countries
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                    self.view.bringSubviewToFront(self.tableView)
                }
                print(countries)
                
                
            case .failure(let error):
                print(error)
            }
        }
    }
}


//MARK: - TableView Delegates, Datasource

extension CountryListVC: UITableViewDelegate, UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countries.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CountryCell.reuseId) as! CountryCell
        let country = countries[indexPath.row]
        cell.set(country: country)
        
        return cell
    }
    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let country = countries[indexPath.row]
//        let destVC = CountryInfoVC()
//        destVC.name = country.name
//        destVC.title = countr.name
//
//        navigationController?.pushViewController(destVC, animated: true)
//    }
}
