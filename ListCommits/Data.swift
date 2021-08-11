//
//  Data.swift
//  ListCommits
//
//  Created by Tom Limbaugh on 8/11/21.
//

import Foundation

let commitData: [Commit] = loadData()

func loadData() -> [Commit] {
    var results = [Commit]()
    var request = URLRequest(url: (URL(string: "https://api.github.com/search/commits?q=committer-date:2021-08-09") ?? URL(string:"https://api.github.com"))!, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 10)
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
            results.append(Commit.init(author: key, hash: key, message: key))
            if key == "items" {
                print(value) // get a picture of the json object
            }
        }
    }
    .resume()
    return results
}
