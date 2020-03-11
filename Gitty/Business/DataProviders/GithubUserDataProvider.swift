//
//  GithubUserDataProvider.swift
//  Gitty
//
//  Created by Joey Nelson on 3/11/20.
//  Copyright © 2020 nelsonje. All rights reserved.
//

import Foundation

final class GithubUserDataProvider {
    
    private var store: Store
    var client: GithubUserClient
    
    init(store: Store, client: GithubUserClient) {
        self.store = store
        self.client = client
    }
    
    func getSearchResults(forKeyword keyword: String, page: Int, completion: @escaping (_ users: [GithubUser], _ errorMessage: String?) -> ()) {
        client.searchUsers(withKeyword: keyword, page: page) { (users, error) in
            DispatchQueue.main.async {
                if let users = users {
                    completion(users, nil)
                } else {
                    let errorMessage = error != nil ? error!.localizedDescription : "Something went horribly wrong."
                    completion([], errorMessage)
                }                
            }
        }
    }
    
    func getRepos(forUser user: GithubUser, completion: @escaping (_ repos: [GithubRepository], _ errorMessage: String?) -> ()) {
        if let user = store.getUser(with: user.id), let repos = user.repos {
            completion(repos, nil)
        } else {
            client.getRepos(forUser: user) { [weak self] (repos, error) in
                DispatchQueue.main.async {
                    if let repos = repos {
                        var storedUser = user
                        storedUser.repos = repos
                        self?.store.storeUser(storedUser, with: storedUser.id)
                        completion(repos, nil)
                    } else {
                        let errorMessage = error != nil ? error!.localizedDescription : "Something went horribly wrong."
                        completion([], errorMessage)
                    }
                }
            }
        }
    }
}
