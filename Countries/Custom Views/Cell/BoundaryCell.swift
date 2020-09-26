//
//  BoundaryCell.swift
//  Countries
//
//  Created by Dmitriy Chernov on 26.09.2020.
//

import UIKit

class BoundaryCell: UITableViewCell {

        static let reuseId = "BoundaryCell"
        
        let nameLabel = CTitleLable(textAlignment: .left, fontSize: 16)
        
        override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
            super.init(style: style, reuseIdentifier: reuseIdentifier)
            configure()
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        private func configure() {
            addSubview(nameLabel)
            
            accessoryType = .disclosureIndicator
            let padding: CGFloat = 8
            
            NSLayoutConstraint.activate([
                nameLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
                nameLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: padding),
                nameLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -75),
                nameLabel.heightAnchor.constraint(equalToConstant: 20),
                
            ])
        }
    }

