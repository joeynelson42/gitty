//
//  SceneDelegate.swift
//  Gitty
//
//  Created by Joey Nelson on 3/11/20.
//  Copyright © 2020 nelsonje. All rights reserved.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        let networkService = StandardNetworkService()
        let store = Store()
        let dependencyContainer = DependencyContainer(networkService: networkService, store: store)
        
        let root = RootViewController(dependencyContainer: dependencyContainer)
        window = UIWindow(frame: windowScene.coordinateSpace.bounds)
        window?.windowScene = windowScene
        window?.rootViewController = root
        window?.makeKeyAndVisible()
    }
}
