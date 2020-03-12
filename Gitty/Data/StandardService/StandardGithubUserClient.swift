//
//  StandardGithubUserClient.swift
//  Gitty
//
//  Created by Joey Nelson on 3/11/20.
//  Copyright © 2020 nelsonje. All rights reserved.
//

import Foundation

final class StandardGithubUserClient: GithubUserClient {
    
    var baseURLComponents: URLComponents
    
    private let defaultSession = URLSession(configuration: .default)
    private let searchCache = Cache<String, GithubUserSearchResult>()
    
    init(baseURLComponents: URLComponents) {
        self.baseURLComponents = baseURLComponents
    }
    
    func searchUsers(withKeyword keyword: String, page: Int, completion: @escaping NetworkCompletionHandler<[GithubUser]>) {
        let searchTerms = keyword.replacingOccurrences(of: " ", with: "+")
        
        if let cachedResult = searchCache.value(for: searchTerms) {
            completion(cachedResult.users, nil)
        }
        
        var components = baseURLComponents
        components.path = "/search/users"
        components.queryItems = [
            URLQueryItem(name: "q", value: searchTerms),
            URLQueryItem(name: "page", value: "\(page)")
        ]
        
        guard let url = components.url else {
            completion(nil, NetworkServiceError(localizedDescription: "Failed to construct URL."))
            return
        }
        
        performGET(url: url) { [weak self] (result: GithubUserSearchResult?, error) in
            if let result = result {
                self?.searchCache.cache(value: result, for: searchTerms)
            }
            
            completion(result?.users ?? nil, error)
        }
    }
    
    func getUserProfileDetails(forUser user: GithubUser, completion: @escaping NetworkCompletionHandler<GithubUserProfileDetails>) {
        guard let url = URL(string: user.profileURL) else {
            completion(nil, NetworkServiceError(localizedDescription: "Failed to construct URL."))
            return
        }
        
        performGET(url: url, completion: completion)
    }
    
    func getRepos(forUser user: GithubUser, completion: @escaping NetworkCompletionHandler<[GithubRepository]>) {
        guard let url = URL(string: user.reposURL) else {
            completion(nil, NetworkServiceError(localizedDescription: "Failed to construct URL."))
            return
        }
        
        performGET(url: url, completion: completion)
    }
    
    private func performGET<T: Decodable>(url: URL, completion: @escaping NetworkCompletionHandler<T>) {
        
        let dataTask = defaultSession.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(nil, error)
            } else if let data = data, let response = response as? HTTPURLResponse, response.statusCode == 200 {
                let decoder = JSONDecoder()
                do {
                    let result = try decoder.decode(T.self, from: data)
                    completion(result, nil)
                } catch {
                    print(error)
                    completion(nil, error)
                }
            }
        }
        
        dataTask.resume()
    }
}
