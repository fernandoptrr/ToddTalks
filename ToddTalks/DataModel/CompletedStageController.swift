//
//  StageController.swift
//  ToddTalks
//
//  Created by Kresna Faza R on 03/05/23.
//

import Foundation
import CoreData

class StageController : ObservableObject {
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
            print("Data SAVED")
        } catch {
            print("Unable to save data")
        }
    }
    
    func addCompletedStage(title: String, starCount: Int16, context: NSManagedObjectContext) {
        let stage = CompletedStage(context: context)
        stage.id = UUID()
        stage.title = title
        stage.starCount = starCount
        
        save(context: context)
    }
    
    func editCompletedStage(completedStage: CompletedStage, starCount: Int16, context: NSManagedObjectContext) {
        completedStage.starCount = starCount
        
        save(context: context)
    }
    
}
