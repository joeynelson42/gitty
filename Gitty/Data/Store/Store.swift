//
//  UserStore.swift
//  Gitty
//
//  Created by Joey Nelson on 3/11/20.
//  Copyright © 2020 nelsonje. All rights reserved.
//

import UIKit

final class Store {
    private var imageCache = Cache<String, UIImage>()
    private var userCache = Cache<Int, GithubUser>()
    
    func clear() {
        imageCache.clear()
        userCache.clear()
    }
    
    func getImage(with id: String) -> UIImage? {
        return imageCache.value(for: id)
    }
    
    func storeImage(_ image: UIImage, with id: String) {
        imageCache.cache(value: image, for: id)
    }
    
    func getUser(with id: Int) -> GithubUser? {
        return userCache.value(for: id)
    }
    
    func storeUser(_ user: GithubUser, with id: Int) {
        userCache.cache(value: user, for: id)
    }
}
