//
//  StandardNetworkService.swift
//  Gitty
//
//  Created by Joey Nelson on 3/11/20.
//  Copyright © 2020 nelsonje. All rights reserved.
//

import Foundation

final class StandardNetworkService: NetworkService {
    
    let baseURLComponents = URLComponents(string: "https://api.github.com")!
    
    lazy var userClient: GithubUserClient = StandardGithubUserClient(baseURLComponents: baseURLComponents)
    
    lazy var imageClient: ImageClient = StandardImageClient()
    
}
