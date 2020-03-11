//
//  ViewControllerFactory.swift
//  Gitty
//
//  Created by Joey Nelson on 3/11/20.
//  Copyright © 2020 nelsonje. All rights reserved.
//

import Foundation

protocol ViewControllerFactory {
    func buildUserSearchViewController() -> UserSearchViewController
}
