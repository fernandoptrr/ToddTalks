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
    var body: some Scene {
        WindowGroup {
            //            AchievementListView().environment(\.managedObjectContext, achievementController.container.viewContext)
//            GameSceneView().environmentObject(gameViewModel)
            MilestoneView().environment(\.managedObjectContext, achievementController.container.viewContext)
        }
    }
}
