//
//  GithubRepository.swift
//  Gitty
//
//  Created by Joey Nelson on 3/11/20.
//  Copyright © 2020 nelsonje. All rights reserved.
//

import Foundation

struct GithubRepository: Codable {
    var id: Int
    var name: String
    var forksCount: Int
    var stargazersCount: Int
    
    enum CodingKeys: String, CodingKey {
      case id, name, forks_count, stargazers_count
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(Int.self, forKey: .id)
        name = try container.decode(String.self, forKey: .name)
        forksCount = try container.decode(Int.self, forKey: .forks_count)
        stargazersCount = try container.decode(Int.self, forKey: .stargazers_count)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encode(name, forKey: .name)
        try container.encode(forksCount, forKey: .forks_count)
        try container.encode(stargazersCount, forKey: .stargazers_count)
    }
}
