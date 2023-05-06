//
//  GameViewModel.swift
//  ToddTalks
//
//  Created by Fernando Putra on 04/05/23.
//

import Foundation

class GameViewModel: ObservableObject {
    @Published var games: [Game]
    @Published var currentGameIndex: Int = 0 
    @Published var reachedEnd: Bool = false
    
    init(games: [Game]) {
        self.games = games.shuffled()
    }
    
    var isInfoScene: Bool {
        if games.indices.contains(currentGameIndex) {
            let currentGame = games[currentGameIndex]
            return currentGame.status == .incomplete || currentGame.status == .completed
        } else {
            return false
        }
    }

    func nextGame() {
        if reachedEnd { return }
        if currentGameIndex < games.count - 1 {
            reachedEnd = false
            currentGameIndex += 1
        } else {
            reachedEnd = true
        }
    }
    
    func setGameIncomplete() {
        if games.indices.contains(currentGameIndex) {
            games[currentGameIndex].status = .incomplete
        }
    }
    
    func setGameCompleted() {
        if games.indices.contains(currentGameIndex) {
            games[currentGameIndex].status = .completed
        }
    }
}


