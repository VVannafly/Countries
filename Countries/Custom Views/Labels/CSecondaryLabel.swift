//
//  CSecondaryLabel.swift
//  Countries
//
//  Created by Dmitriy Chernov on 25.09.2020.
//

import UIKit

class CSecondaryLabel: UILabel {

        override init(frame: CGRect) {
            super.init(frame:frame)
            configure()
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }

        
        init(fontSize: CGFloat) {
            super.init(frame: .zero)
            font = UIFont.systemFont(ofSize: fontSize, weight: .medium)
            configure()
        }
        
        
        private func configure() {
            textColor = .secondaryLabel
            adjustsFontSizeToFitWidth = true
            minimumScaleFactor = 0.90                                   //Minimum size of TitleFont
            lineBreakMode = .byTruncatingTail                           //If it does too big, how it breaks the line
            translatesAutoresizingMaskIntoConstraints = false           //deleting auto constraints
            
        }

    }
