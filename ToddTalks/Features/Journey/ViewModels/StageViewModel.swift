//
//  StageViewModel.swift
//  ToddTalks
//
//  Created by Fernando Putra on 02/05/23.
//

import Foundation

class StageViewModel: ObservableObject {
    @Published var stagses: [[Stage]] = [
        [
            Stage(illPath: "play.fill", title: "Gesture 1", body: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor.", tips: "haha", starCount: 3)
        ],
        [
            Stage(illPath: "play.fill", title: "Body Language 1", body: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor.", tips: "haha", starCount: 2),
            Stage(illPath: "play.fill", title: "Body Language 2", body: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor.", tips: "haha", starCount: 1)
        ],
        [
            Stage(illPath: "play.fill", title: "Turn 1", body: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor.", tips: "haha", starCount: 2),
            Stage(illPath: "play.fill", title: "Turn 2", body: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor.", tips: "haha", starCount: 1),
            Stage(illPath: "play.fill", title: "Turn 3", body: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor.", tips: "haha", starCount: 0)
        ],
        [
            Stage(illPath: "play.fill", title: "Review", body: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor.", tips: nil, starCount: 0)
        ]
    ]
}
