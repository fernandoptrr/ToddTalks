//
//  MilestoneCard.swift
//  ToddTalks
//
//  Created by Angelica Pinonkuan on 23/04/23.
//
import Foundation

struct MilestoneCard: Identifiable, Hashable {

    var id : Int
    var animationName: String
    var startMonth: Int
    var endMonth: Int
    var description: String
    var totalStage: Int
    var progress: Int
    var hintText: String

}
