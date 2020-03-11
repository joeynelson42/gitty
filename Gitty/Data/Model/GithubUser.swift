//
//  GithubUser.swift
//  Gitty
//
//  Created by Joey Nelson on 3/11/20.
//  Copyright © 2020 nelsonje. All rights reserved.
//

import Foundation

struct GithubUser: Codable {
    var id: Int
    var username: String
    var avatarURL: String
    var reposURL: String
    var profileURL: String
    
    var profile: GithubUserProfileDetails?
    var repos: [GithubRepository]?
    
    enum CodingKeys: String, CodingKey {
      case id, login, avatar_url, repos_url, url
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(Int.self, forKey: .id)
        username = try container.decode(String.self, forKey: .login)
        avatarURL = try container.decode(String.self, forKey: .avatar_url)
        profileURL = try container.decode(String.self, forKey: .url)
        reposURL = try container.decode(String.self, forKey: .repos_url)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encode(username, forKey: .login)
    }
}
