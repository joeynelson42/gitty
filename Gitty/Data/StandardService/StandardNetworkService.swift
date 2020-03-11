//
//  StandardNetworkService.swift
//  Gitty
//
//  Created by Joey Nelson on 3/11/20.
//  Copyright © 2020 nelsonje. All rights reserved.
//

import Foundation

final class StandardNetworkService: NetworkService {
    var userClient: GithubUserClient = StandardGithubUserClient()
}
