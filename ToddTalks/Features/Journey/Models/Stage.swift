//
//  Stage.swift
//  ToddTalks
//
//  Created by Fernando Putra on 25/04/23.
//

import Foundation

struct Stage: Hashable, Identifiable {
    let id: String
    let icon: String
    let label: String
    let title: String
    let body: String
    let tips: String?
    let games: [Game]
    var starCount: Int
}

