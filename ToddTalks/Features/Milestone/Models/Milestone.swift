//
//  MilestoneCard.swift
//  ToddTalks
//
//  Created by Angelica Pinonkuan on 23/04/23.
//
import Foundation
import SwiftUI

struct Milestone: Identifiable {
    let id = UUID()
    let illPath: String
    let title: String
    let body: String
    let progVal: Int
    let progMaxVal: Int
    let tips: [String]
    let colorTheme: Color
    
    var progLabel: String {
        return "\(progVal)/\(progMaxVal) Bintang"
    }
}
