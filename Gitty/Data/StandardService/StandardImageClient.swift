//
//  StandardImageClient.swift
//  Gitty
//
//  Created by Joey Nelson on 3/11/20.
//  Copyright © 2020 nelsonje. All rights reserved.
//

import Foundation

final class StandardImageClient: ImageClient {
    
    private let defaultSession = URLSession(configuration: .default)
    
    func downloadImage(from url: URL, completion: @escaping (Data?, Error?) -> ()) {
        let dataTask = defaultSession.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(nil, error)
            } else if let data = data, let response = response as? HTTPURLResponse, response.statusCode == 200 {
                completion(data, nil)
            }
        }
        dataTask.resume()
    }
}
