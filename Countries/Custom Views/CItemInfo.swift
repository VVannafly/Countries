//
//  CItemInfo.swift
//  Countries
//
//  Created by Dmitriy Chernov on 26.09.2020.
//

import UIKit

class CItemInfo: UIView {
    
    let nameLabel = CTitleLable(textAlignment: .left, fontSize: 16)
    let valueLabel = CBodyLabel(textAlignment: .right)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set(nameLabel: String, value: String) {
        self.nameLabel.text = nameLabel
        valueLabel.text = value
    }
    
    private func configure() {
        addSubview(nameLabel)
        addSubview(valueLabel)
        
        let padding: CGFloat = 8
        
        NSLayoutConstraint.activate([
            nameLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            nameLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: padding),
            nameLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -padding),
            nameLabel.heightAnchor.constraint(equalToConstant: 40),
            
            valueLabel.topAnchor.constraint(equalTo: nameLabel.topAnchor),
            valueLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -padding),
            valueLabel.heightAnchor.constraint(equalToConstant: 40),
            valueLabel.widthAnchor.constraint(equalToConstant: 150)
        ])
    }
    
}
