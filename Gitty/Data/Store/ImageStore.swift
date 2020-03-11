//
//  ImageStore.swift
//  Gitty
//
//  Created by Joey Nelson on 3/11/20.
//  Copyright © 2020 nelsonje. All rights reserved.
//

import UIKit

final class ImageStore {
    private var cache = Cache<String, UIImage>()
    
    func clearCache() {
        cache.clear()
    }
    
    func getImage(with id: String) -> UIImage? {
        return cache.value(for: id)
    }
    
    func storeImage(_ image: UIImage, with id: String) {
        cache.cache(value: image, for: id)
    }
}
