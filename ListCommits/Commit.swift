//
//  Commit.swift
//  ListCommits
//
//  Created by Tom Limbaugh on 8/11/21.
//

import Foundation

struct Commit: Codable {
    var author: String
    var hash: String
    var message: String
}
