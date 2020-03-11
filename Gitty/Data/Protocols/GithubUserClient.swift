//
//  GithubUserClient.swift
//  Gitty
//
//  Created by Joey Nelson on 3/11/20.
//  Copyright © 2020 nelsonje. All rights reserved.
//

import Foundation

/// The Client which handles the network calls related to GithubUser resources.
protocol GithubUserClient {
    func searchUsers(withKeyword keyword: String, page: Int, completion: @escaping NetworkCompletionHandler<[GithubUser]>)
}
