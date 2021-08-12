//
//  Data.swift
//  ListCommits
//
//  Created by Tom Limbaugh on 8/11/21.
//

import Foundation

let commitData: [Commit] = loadData()
let fakeCommitData: [Commit] = [Commit(id: 1000, author: "Tom Limbaugh", hash: "e3365be8c8992cefc303b9504bd6face0e998479", message: "Initial commit"), Commit(id: 1001, author: "amgtr", hash: "f4375ee8c8992cefc707b4504cd7fade0e193475", message: "search feature"), Commit(id: 1002, author: "boxer", hash: "f4375ee8c2435cefc709c4504cd7cdde0e822711", message: "fixed nav")]

func loadData() -> [Commit] {
    var results = [Commit]()
    var request = URLRequest(url: (URL(string: "https://api.github.com/search/commits?q=committer-date:2021-08-09") ?? URL(string:"https://api.github.com"))!, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 5)
    request.allHTTPHeaderFields = [
        "Content-Type": "application/json",
        "Accept": "application/vnd.github.cloak-preview"
    ]
    request.httpMethod = "GET"
    
    let task = URLSession.shared.dataTask(with: request) {(data, response, error) in
        guard let data = data else { return }
        // print(String(data: data, encoding: .utf8)!)
        
        let jsonData = try! JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
        
        for (key, value) in jsonData! {
            results.append(Commit.init(id: Int(key) ?? 1, author: key, hash: key, message: key))
            
            if key == "items" {
                print(value) // get a picture of the json object
            }
        }
    }
    .resume()
    return results
}
