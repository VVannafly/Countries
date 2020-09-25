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
                print( error)
                
            }
        }
    }
    
    func configureUIElements(with country: CountryInfo) {
//        let repoItemVC = GFRepoItemVC(user: user)
//        repoItemVC.delegate = self
//
//        let followerItemVC = GFFollowerItemVC(user:user)
//        followerItemVC.delegate = self
        
        self.add(childVC: CountryInfoHeaderVC(country: country), to: self.headerView)
        self.add(childVC: CountryPopulationInfoVC(country: country), to: self.itemViewOne)
//        self.add(childVC: followerItemVC, to: self.itemViewTwo)
//        self.dateLabel.text = "GitHub since \(user.createdAt.convertToDisplayFormat())"
    }
    
    func layoutUI() {
        let padding: CGFloat = 20
//        let itemHeight: CGFloat = 140
        
        itemViews = [headerView, itemViewOne] // itemViewOne, itemViewTwo, dateLabel
        
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
            //            itemViewTwo.topAnchor.constraint(equalTo: itemViewOne.bottomAnchor, constant: padding),
            //            itemViewTwo.heightAnchor.constraint(equalToConstant: itemHeight),
            //
            //            dateLabel.topAnchor.constraint(equalTo: itemViewTwo.bottomAnchor, constant: padding),
            //            dateLabel.heightAnchor.constraint(equalToConstant: 18)
        ])
    }
    
    func add(childVC: UIViewController, to containerView: UIView){
        addChild(childVC)
        containerView.addSubview(childVC.view)
        childVC.view.frame = containerView.bounds
        childVC.didMove(toParent: self)
    }
    
}
