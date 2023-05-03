//
//  ToddTalksApp.swift
//  ToddTalks
//
//  Created by Fernando Putra on 17/04/23.
//

import SwiftUI

@main
struct ToddTalksApp: App {
    
    init(){
        for family in UIFont.familyNames {
             print(family)

             for names in UIFont.fontNames(forFamilyName: family){
             print("== \(names)")
             }
        }
    }
    var body: some Scene {
        WindowGroup {
//            MilestoneView()
            SpeechToTextView()
        }
    }
}
