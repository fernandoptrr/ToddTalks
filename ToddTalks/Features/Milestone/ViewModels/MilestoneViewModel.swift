//
//  MilestoneViewModel.swift
//  ToddTalks
//
//  Created by Fernando Putra on 01/05/23.
//

import Foundation

class MilestoneViewModel: ObservableObject {
    @Published var milestones: [Milestone] = [MilestoneData.milestone1, MilestoneData.milestone2, MilestoneData.milestone3]
}
