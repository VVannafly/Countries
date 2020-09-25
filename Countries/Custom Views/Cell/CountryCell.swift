//
//  CountryCell.swift
//  Countries
//
//  Created by Dmitriy Chernov on 25.09.2020.
//

import UIKit

class CountryCell: UITableViewCell {

    static let reuseId = "CountryCell"
    
    let nameLabel = CTitleLable(textAlignment: .left, fontSize: 16)
    let codeLabel = CBodyLabel(textAlignment: .right)
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set(country: CountryList) {
        nameLabel.text = country.name
        codeLabel.text = country.alpha3Code
    }
    
    private func configure() {
        addSubview(nameLabel)
        addSubview(codeLabel)
        
        accessoryType = .disclosureIndicator
        let padding: CGFloat = 8
        
        NSLayoutConstraint.activate([
            nameLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            nameLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: padding),
            nameLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -75),
            nameLabel.heightAnchor.constraint(equalToConstant: 20),
            
            codeLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            codeLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -40),
            codeLabel.heightAnchor.constraint(equalToConstant: 16)
        ])
    }
}
