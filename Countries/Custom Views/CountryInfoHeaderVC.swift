//
//  CountryInfoHeaderVC.swift
//  Countries
//
//  Created by Dmitriy Chernov on 25.09.2020.
//

import UIKit


class CountryInfoHeaderVC: UIViewController {
    
    let flagImageView = FlagImageView(frame: .zero)
    
    let nativeTitle = CSecondaryLabel(fontSize: 18)
    let nativeName = CSecondaryLabel(fontSize: 16)
    let regionLabel = CSecondaryLabel(fontSize: 18)
    let locationImageView = UIImageView()
    let locationLabel = CSecondaryLabel(fontSize: 16)
    var itemLabels: [UIView] = []
    
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
        addSubview()
        layoutUI()
        configureUIElements()
    }
    
    func configureUIElements() {
        flagImageView.downloadImage(from: country.flag)
        nativeTitle.text = "Native Name:"
        nativeName.text = country.nativeName
        regionLabel.text = "Region:"
        locationLabel.text = country.region
        
        
        
        locationImageView.image = UIImage(systemName: "mappin.and.ellipse")
        locationImageView.tintColor = .secondaryLabel
        
    }
    
    func addSubview() {
        view.addSubview(flagImageView)
        view.addSubview(locationImageView)
        view.addSubview(locationLabel)
    }
    
    func layoutUI() {
        let padding: CGFloat = 20
        let textImagePadding: CGFloat = 12
        
        itemLabels = [nativeTitle, nativeName, regionLabel]
        
        for itemLabel in itemLabels {
            view.addSubview(itemLabel)
            itemLabel.translatesAutoresizingMaskIntoConstraints = false
            
            NSLayoutConstraint.activate([
                itemLabel.leadingAnchor.constraint(equalTo: flagImageView.trailingAnchor, constant: textImagePadding),
                itemLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
                itemLabel.heightAnchor.constraint(equalToConstant: 20)
            ])
        }
        
        locationImageView.translatesAutoresizingMaskIntoConstraints = false
        
        
        NSLayoutConstraint.activate([
            
            flagImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: padding),
            flagImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            flagImageView.heightAnchor.constraint(equalToConstant: 90),
            flagImageView.widthAnchor.constraint(equalToConstant: 150),
            
            
            nativeTitle.topAnchor.constraint(equalTo: flagImageView.topAnchor),
            
            nativeName.topAnchor.constraint(equalTo: nativeTitle.bottomAnchor, constant: 2),
            
            regionLabel.topAnchor.constraint(equalTo: nativeName.bottomAnchor, constant: 3),

            
            locationImageView.bottomAnchor.constraint(equalTo: flagImageView.bottomAnchor),
            locationImageView.leadingAnchor.constraint(equalTo: flagImageView.trailingAnchor, constant: textImagePadding),
            locationImageView.widthAnchor.constraint(equalToConstant: 20),
            locationImageView.heightAnchor.constraint(equalToConstant: 20),
            
            
            locationLabel.centerYAnchor.constraint(equalTo: locationImageView.centerYAnchor),
            locationLabel.leadingAnchor.constraint(equalTo: locationImageView.trailingAnchor, constant: 5),
            locationLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            locationLabel.heightAnchor.constraint(equalToConstant: 20),
            
            
        ])
    }
}
