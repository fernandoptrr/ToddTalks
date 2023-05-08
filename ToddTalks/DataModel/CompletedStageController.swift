//
//  StageController.swift
//  ToddTalks
//
//  Created by Kresna Faza R on 03/05/23.
//

import Foundation
import CoreData

class CompleteStageController : ObservableObject {
    let container = NSPersistentContainer(name : "CompletedStageModel")
    
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
            print("Data star SAVED")
        } catch {
            print("Unable to save data")
        }
    }
    
    func addCompletedStage(stageId: String, starCount: Int16, context: NSManagedObjectContext) {
        let stage = CompletedStage(context: context)
        stage.stageId = stageId
        stage.starCount = starCount
        
        save(context: context)
    }
    
    func editCompletedStage(completedStage: CompletedStage, starCount: Int16, context: NSManagedObjectContext) {
        completedStage.starCount = starCount
        
        save(context: context)
    }
    
}
