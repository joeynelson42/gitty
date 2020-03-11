//
//  DependencyContainer.swift
//  Gitty
//
//  Created by Joey Nelson on 3/11/20.
//  Copyright © 2020 nelsonje. All rights reserved.
//

import Foundation

/// The DependencyContainer is an encapsulation of the main dependencies within the UI layer, i.e. Factories and NetworkService.
final class DependencyContainer {
    
    var networkService: NetworkService
    var imageStore: ImageStore
    
    init(networkService: NetworkService, imageStore: ImageStore) {
        self.networkService = networkService
        self.imageStore = imageStore
    }
}

extension DependencyContainer: DataProviderFactory {
    func buildGithubUserDataProvider() -> GithubUserDataProvider {
        return GithubUserDataProvider(client: networkService.userClient)
    }
    
    func buildImageDataProvider() -> ImageDataProvider {
        return ImageDataProvider(store: imageStore, client: networkService.imageClient)
    }
}

extension DependencyContainer: ViewControllerFactory {
    func buildUserSearchViewController() -> UserSearchViewController {
        return UserSearchViewController(userDataProvider: buildGithubUserDataProvider(), imageDataProvider: buildImageDataProvider())
    }
}
