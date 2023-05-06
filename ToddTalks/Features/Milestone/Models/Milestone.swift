//
//  MilestoneCard.swift
//  ToddTalks
//
//  Created by Angelica Pinonkuan on 23/04/23.
//
import Foundation
import SwiftUI

struct Milestone: Identifiable {
    let id: String
    let image: String
    let title: String
    let body: String
    var progVal: Int
    let progMaxVal: Int
    let tips: [String]
    let colorTheme: Color
    let journey: [Section]
    
    var progLabel: String {
        return "\(progVal)/\(progMaxVal) Bintang"
    }
}
