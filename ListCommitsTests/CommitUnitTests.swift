//
//  ListCommitsTests.swift
//  ListCommitsTests
//
//  Created by Tom Limbaugh on 8/11/21.
//

import XCTest
@testable import ListCommits

class CommitUnitTests: XCTestCase {
    
    var newCommit = Commit(author: "Tom Limbaugh", hash: "e3365be8c8992cefc303b9504bd6face0e998479", message: "initial commit")

    override func setUpWithError() throws {
        
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testThatCommitExists() throws {
        
        XCTAssertNotNil(newCommit, "Should be able to create an instance of Commit")
    }
    
    func testThatCommitCanHaveAnAuthor() {
        
        XCTAssertEqual(newCommit.author, "Tom Limbaugh", "Should be able to have author")
    }
    
    func testThatCommitCanHaveHashValue() {
        
        XCTAssertEqual(newCommit.hash, "e3365be8c8992cefc303b9504bd6face0e998479", "Should be able to have hash value")
    }
    
    func testThatCommitCanHaveAMessage() {
        
        XCTAssertEqual(newCommit.message, "initial commit", "Should be able to have commit message")
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
