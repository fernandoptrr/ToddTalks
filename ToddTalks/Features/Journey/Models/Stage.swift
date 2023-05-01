//
//  Stage.swift
//  ToddTalks
//
//  Created by Fernando Putra on 25/04/23.
//

import Foundation

struct Stage: Hashable, Identifiable {
    let id = UUID()
    let illPath: String
    let title: String
    let body: String
    let tips: String?
    let starCount: Int
}
