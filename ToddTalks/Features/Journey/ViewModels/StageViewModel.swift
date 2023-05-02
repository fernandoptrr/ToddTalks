//
//  StageViewModel.swift
//  ToddTalks
//
//  Created by Fernando Putra on 02/05/23.
//

import Foundation

class StageViewModel: ObservableObject {
    @Published var stages: [[Stage]] = [
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
    
    @Published var sectionGuidelines = [
        SectionGuideline(illPath: Lotties.baby, headline: "Section 1 Guideline", subHeadline: "Pelajari tips tata bahasa dan frasa kunci untuk unit ini", title: "FRASA KUNCI", body: "Memakai kata jamak", tips: ["Some really long text in the speech bubble over multiple lines.", "Some really long text in the speech bubble over multiple lines.", "Some really long text in the speech bubble over multiple lines."]),
        SectionGuideline(illPath: Lotties.baby, headline: "Section 1 Guideline", subHeadline: "Pelajari tips tata bahasa dan frasa kunci untuk unit ini", title: "FRASA KUNCI", body: "Memakai kata jamak", tips: ["Some really long text in the speech bubble over multiple lines.", "Some really long text in the speech bubble over multiple lines.", "Some really long text in the speech bubble over multiple lines."]),
        SectionGuideline(illPath: Lotties.baby, headline: "Section 1 Guideline", subHeadline: "Pelajari tips tata bahasa dan frasa kunci untuk unit ini", title: "FRASA KUNCI", body: "Memakai kata jamak", tips: ["Some really long text in the speech bubble over multiple lines.", "Some really long text in the speech bubble over multiple lines.", "Some really long text in the speech bubble over multiple lines."])
    ]
}
