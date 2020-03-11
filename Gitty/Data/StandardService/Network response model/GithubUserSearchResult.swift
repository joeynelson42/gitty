//
//  GithubUserSearchResult.swift
//  Gitty
//
//  Created by Joey Nelson on 3/11/20.
//  Copyright © 2020 nelsonje. All rights reserved.
//

import Foundation

// Used to parse Github API's User search response
struct GithubUserSearchResult: Codable {
  enum CodingKeys: String, CodingKey {
    case items
  }
  
  let users: [GithubUser]
  
  init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    users = try container.decode([GithubUser].self, forKey: .items)
  }
  
  func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    try container.encode(users, forKey: .items)
  }
}
