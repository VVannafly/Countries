//
//  BoundariesVC.swift
//  Countries
//
//  Created by Dmitriy Chernov on 26.09.2020.
//

import UIKit

class BoundariesVC: UITableViewController {
    
    var country: CountryInfo!
    
    
    init(country: CountryInfo) {
        super.init(nibName: nil, bundle: nil)
        self.country = country
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.largeContentTitle = "Boundaries"
        
        tableView.register(BoundaryCell.self, forCellReuseIdentifier: "BoundaryCell")
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return country.borders.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BoundaryCell") as! BoundaryCell
        cell.nameLabel.text = country.borders[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let boundary = country.borders[indexPath.row]
        let destVC = CountryInfoVC()
        destVC.country = boundary
        
        
        navigationController?.pushViewController(destVC, animated: true)
    

        
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = CTitleLable(textAlignment: .left, fontSize: 20)
        header.text = "Boundaries"
        return header
    }
}
