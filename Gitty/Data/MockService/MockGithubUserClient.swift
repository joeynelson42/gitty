//
//  MockGithubUserClient.swift
//  Gitty
//
//  Created by Joey Nelson on 3/11/20.
//  Copyright © 2020 nelsonje. All rights reserved.
//

import Foundation

final class MockGithubUserClient: GithubUserClient {
    
    var baseURLComponents: URLComponents = URLComponents()
    
    func searchUsers(withKeyword keyword: String, page: Int, completion: @escaping NetworkCompletionHandler<[GithubUser]>) {
        
    }
    
    func getUserProfileDetails(forUser user: GithubUser, completion: @escaping NetworkCompletionHandler<GithubUserProfileDetails>) {
        
    }
    
    func getRepos(forUser user: GithubUser, completion: @escaping NetworkCompletionHandler<[GithubRepository]>) {
        
    }
    
}
