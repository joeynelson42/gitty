//
//  ImageDataProvider.swift
//  Gitty
//
//  Created by Joey Nelson on 3/11/20.
//  Copyright © 2020 nelsonje. All rights reserved.
//

import UIKit

final class ImageDataProvider {
    
    private var store: Store
    private var client: ImageClient
    
    init(store: Store, client: ImageClient) {
        self.store = store
        self.client = client
    }
    
    func getImage(for url: URL, completion: @escaping (_ image: UIImage?, _ errorMessage: String?) -> ()) {
        if let image = store.getImage(with: url.absoluteString) {
            completion(image, nil)
        } else {
            client.downloadImage(from: url) { [weak self] (data, error) in
                DispatchQueue.main.async {
                    if let error = error {
                        completion(nil, error.localizedDescription)
                    } else if let data = data, let image = UIImage(data: data) {
                        self?.store.storeImage(image, with: url.absoluteString)
                        completion(image, nil)
                    }
                }
            }
        }
    }
}
