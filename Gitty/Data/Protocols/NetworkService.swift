//
//  NetworkService.swift
//  Gitty
//
//  Created by Joey Nelson on 3/11/20.
//  Copyright © 2020 nelsonje. All rights reserved.
//

import Foundation

/// A type that is used to communicate with a third-party network, such as a REST API.
/// The NetworkService includes one or more Clients which contain related network calls.
protocol NetworkService {
    
    var userClient: GithubUserClient { get }
    
    var imageClient: ImageClient { get }
    
}

struct NetworkServiceError: Error {
    var localizedDescription: String
}

typealias NetworkCompletionHandler<T> = (_ payload: T?, _ error: Error?) -> ()
