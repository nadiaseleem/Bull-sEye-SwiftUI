//
//  myAppSwiftUITests.swift
//  myAppSwiftUITests
//
//  Created by Nadia Seleem on 30/12/2020.
//

import XCTest
@testable import myAppSwiftUI

class myAppSwiftUITests: XCTestCase {
    
    var game: Game!
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        game = Game()
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        game = nil
    }
    
    func testScorePositive() throws{
        let guess = game.target + 5
        let score = game.points(guess: guess)
        XCTAssertEqual(score, 95)
    }
    
    func testScoreNegative() throws{
        let guess = game.target - 5
        let score = game.points(guess: guess)
        XCTAssertEqual(score, 95)
    }
    
    func testStartNewRound()throws{
        game.startNewRound(points: 100)
        XCTAssertEqual(game.score, 100)
        XCTAssertEqual(game.round, 2)
    }
    
    func testScoreExact() throws{
        let guess = game.target
        game.startNewRound(points: game.points(guess: guess))
        XCTAssertEqual(game.score, 200)
            
    }
    
    func testScoreClose() throws{
        let guess = game.target - 1
        let score = game.points(guess: guess)
        XCTAssertEqual(score, 149)
    }
    
    func testStartOver() throws{
        game.startNewRound(points: 100)
        XCTAssertNotEqual(game.round, 1)
        XCTAssertNotEqual(game.score, 0)
        game.startOver()
        XCTAssertEqual(game.round, 1)
        XCTAssertEqual(game.score, 0)
    }
    
    func testLeaderBoard(){
        game.startNewRound(points: 100)
        XCTAssertEqual(game.leaderboardEntries.count, 1)
        XCTAssertEqual(game.leaderboardEntries[0].score, 100)

        game.startNewRound(points: 200)
        XCTAssertEqual(game.leaderboardEntries.count, 2)
        XCTAssertEqual(game.leaderboardEntries[0].score, 200)
        XCTAssertEqual(game.leaderboardEntries[1].score, 100)


    }
    
}
