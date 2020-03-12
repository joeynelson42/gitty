//
//  NetworkClient.swift
//  Gitty
//
//  Created by Joey Nelson on 3/11/20.
//  Copyright © 2020 nelsonje. All rights reserved.
//

import Foundation

protocol NetworkClient {
    
    func executeGet<T: Decodable>(session: URLSession, url: URL, completion: @escaping NetworkCompletionHandler<T>)
    
}

extension NetworkClient {
    func executeGet<T: Decodable>(session: URLSession, url: URL, completion: @escaping NetworkCompletionHandler<T>) {
        session.dataTask(with: url) { data, response, error in
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
        }.resume()
    }
}
