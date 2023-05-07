//
//  ToddTalksApp.swift
//  ToddTalks
//
//  Created by Fernando Putra on 17/04/23.
//

import SwiftUI

@main
struct ToddTalksApp: App {
    @StateObject private var achievementController = AchievementController()
    @State private var username: String = ""

    var body: some Scene {
        WindowGroup {
            if (username.isEmpty) {
                InputPageView(username: $username)
            }
            else {
                MilestoneView(username: $username).environment(\.managedObjectContext, achievementController.container.viewContext)
            }
        }
    }
}
