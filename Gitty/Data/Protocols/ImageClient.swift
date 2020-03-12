//
//  ImageClient.swift
//  Gitty
//
//  Created by Joey Nelson on 3/11/20.
//  Copyright © 2020 nelsonje. All rights reserved.
//

import Foundation

protocol ImageClient: NetworkClient {
    
    func downloadImage(from url: URL, completion: @escaping NetworkCompletionHandler<Data>)
    
}
