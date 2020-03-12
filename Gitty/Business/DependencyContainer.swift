//
//  DependencyContainer.swift
//  Gitty
//
//  Created by Joey Nelson on 3/11/20.
//  Copyright © 2020 nelsonje. All rights reserved.
//

import Foundation
import SafariServices

/// The DependencyContainer is an encapsulation of the main dependencies within the UI layer, i.e. Factories and NetworkService.
final class DependencyContainer {
    
    var networkService: NetworkService
    var store: Store
    
    lazy var userDataProvider: GithubUserDataProvider = buildGithubUserDataProvider()
    lazy var imageDataProvider: ImageDataProvider = buildImageDataProvider()
    
    init(networkService: NetworkService, store: Store) {
        self.networkService = networkService
        self.store = store
    }
}

extension DependencyContainer: DataProviderFactory {
    func buildGithubUserDataProvider() -> GithubUserDataProvider {
        return GithubUserDataProvider(store: store, client: networkService.userClient)
    }
    
    func buildImageDataProvider() -> ImageDataProvider {
        return ImageDataProvider(store: store, client: networkService.imageClient)
    }
}

extension DependencyContainer: ViewControllerFactory {
    func buildUserSearchViewController() -> UserSearchViewController {
        return UserSearchViewController(userDataProvider: userDataProvider, imageDataProvider: imageDataProvider, controllerFactory: self)
    }
    
    func buildUserProfileViewController(user: GithubUser) -> UserProfileViewController {
        return UserProfileViewController(user: user, dataProvider: userDataProvider, imageDataProvider: imageDataProvider, controllerFactory: self)
    }
    
    func buildRepositoryDetailViewController(repository: GithubRepository) -> UIViewController {
        guard let url = URL(string: repository.url) else {
            return UIViewController() // TODO: Don't do this.
        }
        return SFSafariViewController(url: url)
    }
}
