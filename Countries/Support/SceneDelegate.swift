//
//  SceneDelegate.swift
//  Countries
//
//  Created by Dmitriy Chernov on 25.09.2020.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {

        guard let windowScene = (scene as? UIWindowScene) else { return }
        let countryListNC = UINavigationController(rootViewController: CountryListVC())
        
        window = UIWindow(frame: windowScene.coordinateSpace.bounds)
        window?.rootViewController = countryListNC
        window?.windowScene = windowScene
        window?.makeKeyAndVisible()
    }

    func configureNavigationBar() {
        UINavigationBar.appearance().tintColor = .systemGray
    }
    
    func sceneDidDisconnect(_ scene: UIScene) {
    }

    func sceneDidBecomeActive(_ scene: UIScene) {

    }

    func sceneWillResignActive(_ scene: UIScene) {

    }

    func sceneWillEnterForeground(_ scene: UIScene) {

    }

    func sceneDidEnterBackground(_ scene: UIScene) {

    }


}

