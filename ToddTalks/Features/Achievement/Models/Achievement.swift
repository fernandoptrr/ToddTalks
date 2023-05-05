//
//  Achievement.swift
//  ToddTalks
//
//  Created by Fernando Putra on 03/05/23.
//

import Foundation

struct Achievement: Identifiable {
    let id = UUID()
    let imagePath: String
    let name: String
    let date: Date
    let body: String
    var isEmpty: Bool = true
}

let achievements = [
    
    Achievement(imagePath: "achievement1", name: "Completed first project", date: Date(), body: "I just completed my first project and I'm feeling great!", isEmpty: false),
    Achievement(imagePath: "achievement2", name: "Learned a new programming language", date: Date(), body: "I just learned a new programming language and I'm excited to start using it in my projects."),
    Achievement(imagePath: "achievement3", name: "Published an app on the App Store", date: Date(), body: "My app is now live on the App Store!", isEmpty: false),
//
//    Achievement(imagePath: "achievement4", name: "Presented at a tech conference", date: Date(), body: "I just gave a presentation at a tech conference and it was amazing!"),
//    Achievement(imagePath: "achievement5", name: "Won a programming competition", date: Date(), body: "I just won a programming competition and I couldn't be happier!", isEmpty: false),
//    Achievement(imagePath: "achievement6", name: "Contributed to an open source project", date: Date(), body: "I just made my first contribution to an open source project and it feels great to give back to the community."),
//    Achievement(imagePath: "achievement7", name: "Built a website from scratch", date: Date(), body: "I just built my first website from scratch and I'm so proud of myself!"),
//    Achievement(imagePath: "achievement8", name: "Completed a coding bootcamp", date: Date(), body: "I just completed a coding bootcamp and I feel like I've learned so much."),
//    Achievement(imagePath: "achievement9", name: "Implemented a new feature in my app", date: Date(), body: "I just implemented a new feature in my app and it's working perfectly!"),
//    Achievement(imagePath: "achievement10", name: "Got my first programming job", date: Date(), body: "I just got my first programming job and I'm so excited to start my new career!")
]
