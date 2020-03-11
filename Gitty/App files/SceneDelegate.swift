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
//
//        var networkService: NetworkService!
//        if CommandLine.arguments.contains("--uitesting") || CommandLine.arguments.contains("--testing") {
//            networkService = MockNetworkService()
//        } else {
//            networkService = StandardNetworkService()
//        }
//
//        let imageStore = ImageStore()
//        let dependencyContainer = DependencyContainer(networkService: networkService, imageStore: imageStore)
//        let root = RootViewController(dependencyContainer: dependencyContainer)
        let root = RootViewController()
        window = UIWindow(frame: windowScene.coordinateSpace.bounds)
        window?.windowScene = windowScene
        window?.rootViewController = root
        window?.makeKeyAndVisible()
    }
}
