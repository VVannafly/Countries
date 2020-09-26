//
//  CountryPopulationInfoVC.swift
//  Countries
//
//  Created by Dmitriy Chernov on 25.09.2020.
//

import UIKit

class CountryPopulationInfoVC: UIViewController {
        
        let stackView = UIStackView()
        let itemInfoViewOne = CItemInfo()
        let itemInfoViewTwo = CItemInfo()
        let itemInfoViewThree = CItemInfo()
        
        var country: CountryInfo!
        
        init(country: CountryInfo) {
            super.init(nibName: nil, bundle: nil)
            self.country = country
            var languages = ""
            var currencies = ""
            country.languages.map{ languages.append($0.nativeName + "  ") }             //Change it
            country.currencies.map{ currencies.append($0.name + "  ") }
            itemInfoViewOne.set(nameLabel: "Population", value: String(country.population))
            itemInfoViewTwo.set(nameLabel: "Languages", value: languages)
            itemInfoViewThree.set(nameLabel: "Currencies", value: currencies)
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        override func viewDidLoad() {
            super.viewDidLoad()
            configureBackgroundView()
            layoutUI()
            configureStackView()
        }

        
        private func configureBackgroundView() {
            view.layer.cornerRadius = 18
            view.backgroundColor = .secondarySystemBackground
        }
        
        
        
        private func configureStackView() {
            stackView.axis = .vertical
            stackView.distribution = .equalSpacing
            
            stackView.addArrangedSubview(itemInfoViewOne)       //adding elements to Stack Views
            stackView.addArrangedSubview(itemInfoViewTwo)
            stackView.addArrangedSubview(itemInfoViewThree)
            
            stackView.spacing = 50.0
            stackView.alignment = .fill
        }
        
        private func layoutUI() {
            view.addSubview(stackView)
            
            stackView.translatesAutoresizingMaskIntoConstraints = false
            let padding: CGFloat = 20
            
            NSLayoutConstraint.activate([
                stackView.topAnchor.constraint(equalTo: view.topAnchor, constant: padding),
                stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
                stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
                stackView.heightAnchor.constraint(equalToConstant: 150),
                
            ])
        }
    }
