//
//  StandardGithubUserClient.swift
//  Gitty
//
//  Created by Joey Nelson on 3/11/20.
//  Copyright © 2020 nelsonje. All rights reserved.
//

import Foundation

final class StandardGithubUserClient: GithubUserClient {
    func searchUsers(withKeyword keyword: String, page: Int, completion: @escaping NetworkCompletionHandler<[GithubUser]>) {
        
    }
}
