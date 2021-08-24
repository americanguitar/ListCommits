//
//  Data.swift
//  ListCommits
//
//  Created by Tom Limbaugh on 8/11/21.
//

// will make network connection and call and parse JSON data once the mapping to JSON
// schema is correct. Currently printing the JSON object so mapping can be determined.
// Also currently providing some fake data for CommitList.swift.

import Foundation

let commitData: [Commit] = loadData()
//let fakeCommitData: [Commit] = [Commit(id: 1000, author: "Tom Limbaugh", hash: "e3365be8c8992cefc303b9504bd6face0e998479", message: "Initial commit"), Commit(id: 1001, author: "amgtr", hash: "f4375ee8c8992cefc707b4504cd7fade0e193475", message: "search feature"), Commit(id: 1002, author: "boxer", hash: "f4375ee8c2435cefc709c4504cd7cdde0e822711", message: "fixed nav")]

func loadData() -> [Commit] {
    var results = [Commit]()
    var request = URLRequest(url: (URL(string: "https://api.github.com/search/commits?q=committer-date:2021-08-22") ?? URL(string:"https://api.github.com"))!, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 5)
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
            if key == "items" {
                let itemsArray = value as! NSArray
                var i = 0
                for item in itemsArray {
                    var commitItem: Commit = Commit(id: i, author: "", hash: "", message: "")
                    let itemDict = item as! NSDictionary
                    for (key, value) in itemDict {
                        if key as! String == "commit" {
                            let commit = value as! NSDictionary
                            for (key, value) in commit {
                                if key as! String == "tree" {
                                    let tree = value as! NSDictionary
                                    for (key, value) in tree {
                                        if key as! String == "sha" {
                                            let sha = value as! String
                                            // print(sha)
                                            commitItem.hash = sha
                                        }
                                    }
                                }
                                if key as! String == "committer" {
                                    let committer = value as! NSDictionary
                                    for (key, value) in committer {
                                        if key as! String == "name" {
                                            let name = value as! String
                                            // print(name)
                                            commitItem.author = name
                                        }
                                    }
                                }
                                if key as! String == "message" {
                                    let message = value as! String
                                    // print(message)
                                    commitItem.message = message
                                }
                            }
                        }
                    }
                    results.append(commitItem)
                    i = i + 1
                }
            }
        }
        print(results)
    }
    .resume()
    return results
}

