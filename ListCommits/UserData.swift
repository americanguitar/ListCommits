//
//  UserData.swift
//  ListCommits
//
//  Created by Tom Limbaugh on 8/11/21.
//

import Combine
import SwiftUI

final class UserData: ObservableObject {
    @Published var commits = commitData
    // @Published var fakeCommits = fakeCommitData
}
