//
//  Commit.swift
//  ListCommits
//
//  Created by Tom Limbaugh on 8/11/21.
//

struct Commit: Codable {
    var author: String
    var hash: String
    var message: String
}
