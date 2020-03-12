//
//  GithubUserProfileDetails.swift
//  Gitty
//
//  Created by Joey Nelson on 3/11/20.
//  Copyright © 2020 nelsonje. All rights reserved.
//

import Foundation
 
struct GithubUserProfileDetails: Codable {
    var name: String?
    var avatarURL: String?
    var location: String?
    var bio: String?
    var email: String?
    var repoCount: Int
    var followers: Int
    var following: Int
    var joinDate: Date?
    
    enum CodingKeys: String, CodingKey {
      case name, avatar_url, location, bio, email, public_repos, followers, following, created_at
    }
    
    private var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        return formatter
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        name = try container.decode(String?.self, forKey: .name)
        avatarURL = try container.decode(String?.self, forKey: .avatar_url)
        location = try container.decode(String?.self, forKey: .location)
        bio = try container.decode(String?.self, forKey: .bio)
        email = try container.decode(String?.self, forKey: .email)
        repoCount = try container.decode(Int.self, forKey: .public_repos)
        followers = try container.decode(Int.self, forKey: .followers)
        following = try container.decode(Int.self, forKey: .following)
        
        let dateStr = try container.decode(String.self, forKey: .created_at)
        joinDate = self.dateFormatter.date(from: dateStr)
    }
    
    func encode(to encoder: Encoder) throws {
        
    }
}
