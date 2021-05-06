//
//  Game.swift
//  myAppSwiftUI
//
//  Created by Nadia Seleem on 27/05/1442 AH.
//

import Foundation

struct Game{
    
    var target: Int = Int.random(in: 1...100)
    
    var round: Int = 1
    var score: Int = 0
    var leaderboardEntries: [LeaderboardEntry] = []
    
    init(loadTestData: Bool = false){
        if loadTestData{
            leaderboardEntries.append(LeaderboardEntry(score: 100 , date: Date()))
            leaderboardEntries.append(LeaderboardEntry(score: 200 , date: Date()))
            leaderboardEntries.append(LeaderboardEntry(score: 300 , date: Date()))
            leaderboardEntries.append(LeaderboardEntry(score: 400 , date: Date()))
            leaderboardEntries.append(LeaderboardEntry(score: 500 , date: Date()))
            leaderboardEntries.append(LeaderboardEntry(score: 600 , date: Date()))

        }
    }
    func points(guess: Int) -> Int{
        let difference = abs(guess - target)
        var bonus = 0
        if difference == 0 {
            bonus = 100
        } else if difference <= 2{
            bonus = 50
        }
        
        return 100 - difference + bonus
        
    }
    
    mutating func startNewRound(points: Int){
        addToLeaderBorard(points: points)
        round += 1
        score += points
        target = Int.random(in: 1...100)
        
    }
    
    mutating func startOver(){
        leaderboardEntries = []
        round = 1
        score = 0
        target = Int.random(in: 1...100)
    }
    
    mutating private func addToLeaderBorard(points: Int){
        
        leaderboardEntries.append(LeaderboardEntry(score: points , date: Date()))
        leaderboardEntries.sort { $0.score > $1.score }
    }
    
    
}

struct LeaderboardEntry:Identifiable {
    var id = UUID()
    var score: Int
    var date: Date
}

