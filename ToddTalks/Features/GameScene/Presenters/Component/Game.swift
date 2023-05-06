//
//  GameScene.swift
//  ToddTalks
//
//  Created by Fernando Putra on 04/05/23.
//

import Foundation

struct Game: Hashable, Identifiable {
    let id: String
    let content: String
    let lottie: String
    let infoScene: BabyChat
    var video: String?
    var status: GameStatus = .initial
}

enum GameStatus {
    case initial
    case incomplete
    case completed
}
