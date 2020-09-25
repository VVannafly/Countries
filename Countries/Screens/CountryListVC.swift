//
//  CountryListVC.swift
//  Countries
//
//  Created by Dmitriy Chernov on 25.09.2020.
//

import UIKit

class CountryListVC: UIViewController {

    enum Section {
        case main
    }
    
    var countries: [CountryList] = []
    var filteredCountries: [CountryList] = []
    var isSearching = false
    
    var tableView: UITableView!
    var dataSource: UITableViewDiffableDataSource<Section, CountryList>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureViewController()
        configureTableView()
        getCountries()
        configureDataSource()
        configureSearchController()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
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
//        tableView.dataSource = self
        
        tableView.register(CountryCell.self, forCellReuseIdentifier: CountryCell.reuseId)
    }
    
    func configureSearchController() {
        let searchController = UISearchController()
        searchController.searchResultsUpdater = self
        searchController.searchBar.delegate = self
        searchController.searchBar.placeholder = "Search for a country"
        navigationItem.searchController = searchController
    }

    func getCountries() {
        showLoadingView()
        NetworkManager.shared.getCountries() { [weak self] result in
            
            guard let self = self else { return }
            self.dismissLoadingView()
            
            switch result {
            case .success(let countries):
                self.countries = countries
                self.updateData(on: self.countries)
                
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                    self.view.bringSubviewToFront(self.tableView)
                }
                
            case .failure(let error):
                print(error)
            }
        }
    }
}


//MARK: - TableView Delegates, Datasource

extension CountryListVC: UITableViewDelegate {
    
    func configureDataSource() {
        dataSource = UITableViewDiffableDataSource<Section, CountryList>(tableView: tableView, cellProvider: { (tableView, indexPath, country) -> UITableViewCell? in
            let cell = tableView.dequeueReusableCell(withIdentifier: CountryCell.reuseId, for: indexPath) as! CountryCell
            cell.set(country: country)
            return cell
        })
    }
    
    func updateData(on countries: [CountryList]) {
        var snapshot = NSDiffableDataSourceSnapshot<Section, CountryList>()
        snapshot.appendSections([.main])
        snapshot.appendItems(countries)
        DispatchQueue.main.async {
            self.dataSource.apply(snapshot, animatingDifferences: true)
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countries.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let activeArray = isSearching ? filteredCountries : countries
        let country = activeArray[indexPath.row]
        
        let destVC = CountryInfoVC()
        destVC.country = country.alpha3Code
        destVC.title = country.name

        navigationController?.pushViewController(destVC, animated: true)
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

//MARK: - SearchBar Delegate

extension CountryListVC: UISearchResultsUpdating, UISearchBarDelegate {
    func updateSearchResults(for searchController: UISearchController) {
        guard let filter = searchController.searchBar.text, !filter.isEmpty else { return }
        isSearching = true
        filteredCountries = countries.filter{ $0.name.lowercased().contains(filter.lowercased()) || $0.alpha3Code.lowercased().contains(filter.lowercased())}
        updateData(on: filteredCountries)
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        isSearching = false
        updateData(on: countries)
    }
}
