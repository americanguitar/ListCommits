//
//  ContentView.swift
//  ListCommits
//
//  Created by Tom Limbaugh on 8/11/21.
//

import SwiftUI

struct CommitList: View {
    @EnvironmentObject private var userData: UserData
    // var commits: [Commit]
    var body: some View {
        NavigationView {
            List(userData.fakeCommits, id: \.id) { item in
                    VStack(alignment: .leading) {
                        Text(item.author)
                            .font(.subheadline)
                        Text(item.message)
                        Text(item.hash)
                    }
                }
                .onAppear(perform: load)
                .navigationBarTitle("Recent GitHub Commits", displayMode: .inline)
//            List {
//                ForEach(userData.fakeCommits) { commit in
//                    {
//                        CommitRow(commits: commits)
//                    }
//                }
//            }.onAppear(perform: load)
        }
    }
}
    
func load() {
    loadData()
}

