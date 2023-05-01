//
//  MilestoneViewModel.swift
//  ToddTalks
//
//  Created by Fernando Putra on 01/05/23.
//

import Foundation

class MilestoneViewModel: ObservableObject {
    @Published var milestones: [Milestone] = [
        Milestone(
            illPath: Lotties.baby,
            title: "12 - 24 Bulan",
            body: "Pada tahap ini diharapkan sang anak dapat mengucapkan kata “p” , “w”, “z” dan “t” dengan benar.",
            progVal: 5,
            progMaxVal: 30,
            tips: ["""
                • You're a loyal and caring friend!
                • You're empathetic and have a strong sense of fairness and justice.
                """,
                """
                • You're a loyal and caring friend!
                • You're empathetic and have a strong sense of fairness and justice.
                """,
                """
                • You're a loyal and caring friend!
                • You're empathetic and have a strong sense of fairness and justice.
                """],
            colorTheme: .purpleColor),
        Milestone(
            illPath: Lotties.baby,
            title: "24 - 364 Bulan",
            body: "Pada tahap ini diharapkan sang anak dapat mengucapkan kata “p” , “w”, “z” dan “t” dengan benar.",
            progVal: 5,
            progMaxVal: 30,
            tips: ["""
                • You're a loyal and caring friend!
                • You're empathetic and have a strong sense of fairness and justice.
                """,
                """
                • You're a loyal and caring friend!
                • You're empathetic and have a strong sense of fairness and justice.
                """,
                """
                • You're a loyal and caring friend!
                • You're empathetic and have a strong sense of fairness and justice.
                """],
            colorTheme: .greenColor),
        Milestone(
            illPath: Lotties.baby,
            title: "36 - 42 Bulan",
            body: "Pada tahap ini diharapkan sang anak dapat mengucapkan kata “p” , “w”, “z” dan “t” dengan benar.",
            progVal: 5,
            progMaxVal: 30,
            tips: ["""
                • You're a loyal and caring friend!
                • You're empathetic and have a strong sense of fairness and justice.
                """,
                """
                • You're a loyal and caring friend!
                • You're empathetic and have a strong sense of fairness and justice.
                """,
                """
                • You're a loyal and caring friend!
                • You're empathetic and have a strong sense of fairness and justice.
                """],
            colorTheme: .blueColor)
    ]
}
