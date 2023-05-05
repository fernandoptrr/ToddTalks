//
//  AchievementController.swift
//  ToddTalks
//
//  Created by Kresna Faza R on 05/05/23.
//


import Foundation
import CoreData
import SwiftUI

class AchievementController : ObservableObject {
    let container = NSPersistentContainer(name : "AchievementDataModel")
    
    init() {
        container.loadPersistentStores{desc, error in
            if let error = error {
                print("Failed to load data \(error.localizedDescription)")
            }
        }
    }
    
    func save(context: NSManagedObjectContext){
        do {
            try context.save()
            print("Data SAVED")
        } catch {
            print("Unable to save data \(error)")
        }
    }
    
    func addCompletedAchievement(achievementId: Int16, imageData: Data, context: NSManagedObjectContext) {
        let completeAchievement = CompleteAchievement(context: context)
        completeAchievement.achievementId = achievementId
        completeAchievement.imageData = imageData
        
        print(imageData)
        save(context: context)
    }

    
}

