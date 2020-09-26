//
//  CountryInfoVC.swift
//  Countries
//
//  Created by Dmitriy Chernov on 25.09.2020.
//

import UIKit

class CountryInfoVC: UIViewController {
    
    var country: String?
    
    let headerView = UIView()
    let itemViewOne = UIView()
    let itemViewTwo = UIView()
    var itemViews: [UIView] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        self.navigationController?.navigationBar.tintColor = .systemGray
        layoutUI()
        getCountryInfo()
    }
    
    
    
    func getCountryInfo() {
        NetworkManager.shared.getCountryInfo(for: country!) { [weak self] result in
            guard let self = self else { return }
            
            switch result {
            case .success(let country):
                DispatchQueue.main.async {
                    self.configureUIElements(with: country)
                }
                
            case .failure(let error):
                print(error)
                
            }
        }
    }
    
    func configureUIElements(with country: CountryInfo) {

        self.title = country.name
        self.add(childVC: CountryInfoHeaderVC(country: country), to: self.headerView)
        self.add(childVC: CountryPopulationInfoVC(country: country), to: self.itemViewOne)
        self.add(childVC: BoundariesVC(country: country), to: self.itemViewTwo)
        
    }
    
    func layoutUI() {
        
        let padding: CGFloat = 20
        //        let itemHeight: CGFloat = 140
        
        itemViews = [headerView, itemViewOne, itemViewTwo] // itemViewOne, itemViewTwo, dateLabel
        
        for itemView in itemViews {
            view.addSubview(itemView)
            itemView.translatesAutoresizingMaskIntoConstraints = false
            
            NSLayoutConstraint.activate([
                itemView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
                itemView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding)
            ])
        }
        
        
        NSLayoutConstraint.activate([
            headerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            headerView.heightAnchor.constraint(equalToConstant: 120),
            
            itemViewOne.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: padding),
            itemViewOne.heightAnchor.constraint(equalToConstant: 200),
            //
            itemViewTwo.topAnchor.constraint(equalTo: itemViewOne.bottomAnchor, constant: padding),
            itemViewTwo.heightAnchor.constraint(equalToConstant: 250),

        ])
    }
    
    func add(childVC: UIViewController, to containerView: UIView){
        addChild(childVC)
        containerView.addSubview(childVC.view)
        childVC.view.frame = containerView.bounds
        childVC.didMove(toParent: self)
    }
    
}
