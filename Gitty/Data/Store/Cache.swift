//
//  Cache.swift
//  Gitty
//
//  Created by Joey Nelson on 3/11/20.
//  Copyright © 2020 nelsonje. All rights reserved.
//

import UIKit

final class Cache<Key: Hashable, Value> {
    
    private var cache = [Key : Value]()
    private let queue = DispatchQueue(label: "com.nelsonje.gitty.cacheQueue")
    
    func cache(value: Value, for key: Key) {
        queue.async {
            self.cache[key] = value
        }
    }
    
    func value(for key: Key) -> Value? {
        return queue.sync { cache[key] }
    }
    
    func clear() {
        queue.async {
            self.cache.removeAll()
        }
    }
}
