//
//  ContentView.swift
//  ListCommits
//
//  Created by Tom Limbaugh on 8/11/21.
//

import SwiftUI

import SwiftUI

struct ContentView: View {
    @EnvironmentObject private var userData: UserData
    var body: some View {
        List {
            Text("Loading Data...")
        }.onAppear(perform: load)
    }
}
    
func load() {
    loadData()
}

