//
//  GithubUserDataProvider.swift
//  Gitty
//
//  Created by Joey Nelson on 3/11/20.
//  Copyright © 2020 nelsonje. All rights reserved.
//

import Foundation

final class GithubUserDataProvider {
    
    var client: GithubUserClient
    
    init(client: GithubUserClient) {
        self.client = client
    }
    
    func getSearchResults(forKeyword keyword: String, page: Int, completion: @escaping (_ users: [GithubUser], _ errorMessage: String?) -> ()) {
        client.searchUsers(withKeyword: keyword, page: page) { (users, error) in
            if let users = users {
                completion(users, nil)
            } else {
                let errorMessage = error != nil ? error!.localizedDescription : "Something went horribly wrong."
                completion([], errorMessage)
            }
        }
    }
    
}
