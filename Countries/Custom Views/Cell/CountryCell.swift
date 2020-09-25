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
    let codeLabel = CBodyLabel(textAlignment: .left)
    
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
        let padding: CGFloat = 5
        
        NSLayoutConstraint.activate([
            nameLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            nameLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: padding),
            nameLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -padding),
            nameLabel.heightAnchor.constraint(equalToConstant: 30),
            
            codeLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: padding),
            codeLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: padding),
            codeLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -padding),
            codeLabel.heightAnchor.constraint(equalToConstant: 16)
        ])
    }

}
