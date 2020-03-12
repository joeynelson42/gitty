//
//  ViewControllerFactory.swift
//  Gitty
//
//  Created by Joey Nelson on 3/11/20.
//  Copyright © 2020 nelsonje. All rights reserved.
//

import UIKit

protocol ViewControllerFactory {
    
    func buildUserSearchViewController() -> UserSearchViewController
    
    func buildUserProfileViewController(user: GithubUser) -> UserProfileViewController
    
    func buildRepositoryDetailViewController(repository: GithubRepository) -> UIViewController
}
