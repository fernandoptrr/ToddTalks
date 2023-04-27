//
//  MilestoneCardData.swift
//  ToddTalks
//
//  Created by Angelica Pinonkuan on 25/04/23.
//

import Foundation

final class MilestoneCardData: ObservableObject{
    @Published var milestoneCard: [MilestoneCard] = data
}

var data = [

    MilestoneCard(id: 0, animationName: Lotties.crab, startMonth: 12, endMonth: 24, description: "Pada tahap ini diharapkan sang anak dapat mengucapkan kata “p” , “w”, “z” dan “t” dengan benar.", totalStage: 30, progress: 5, hintText: """
        • You're a loyal and caring friend!
        • You're empathetic and have a strong sense of fairness and justice.
        • You're a natural mediator and prefer to avoid conflict, preferring instead to foster harmony and cooperation among those around you.
        """),
    MilestoneCard(id: 1, animationName: Lotties.crab, startMonth: 24, endMonth: 36, description: "Pada tahap ini diharapkan sang anak dapat mengucapkan kata “p” , “w”, “z” dan “t” dengan benar.", totalStage: 30, progress: 5, hintText: """
        • You're a loyal and caring friend!
        • You're empathetic and have a strong sense of fairness and justice.
        • You're a natural mediator and prefer to avoid conflict, preferring instead to foster harmony and cooperation among those around you.
        """),
    MilestoneCard(id: 2, animationName: Lotties.crab, startMonth: 36, endMonth: 42, description: "Pada tahap ini diharapkan sang anak dapat mengucapkan kata “p” , “w”, “z” dan “t” dengan benar.", totalStage: 30, progress: 5, hintText: """
        • You're a loyal and caring friend!
        • You're empathetic and have a strong sense of fairness and justice.
        • You're a natural mediator and prefer to avoid conflict, preferring instead to foster harmony and cooperation among those around you.
        """)
    
]
