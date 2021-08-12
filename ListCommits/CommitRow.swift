//
//  CommitRow.swift
//  ListCommits
//
//  Created by Tom Limbaugh on 8/12/21.
//

import SwiftUI

struct CommitRow: View {
    var commits: [Commit]
    
    var body: some View {
        VStack(alignment: .leading) {
             ForEach(self.commits, id: \.id) { commit in
                CommitItem(commit: commit)
             }
        }
    }
}

struct CommitItem: View {
    var commit: Commit
    var body: some View {
        VStack {
            Text(commit.author)
            Text(commit.message)
            Text(commit.hash)
        }
        .foregroundColor(.primary)
        .font(.caption)
        .padding(.leading, 15)
    }
}
