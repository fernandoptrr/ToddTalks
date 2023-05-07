//
//  MilestoneData.swift
//  ToddTalks
//
//  Created by Fernando Putra on 05/05/23.
//

import Foundation

struct MilestoneData {
    static let milestone1 = Milestone(
        id: "milestone1",
        image: Lotties.baby,
        title: "12 - 24 Bulan",
        body: "Pada tahap ini diharapkan sang anak dapat mengucapkan kata “p” , “w”, “z” dan “t” dengan benar.",
        progVal: 0,
        progMaxVal: 10,
        tips: ["""
            • Membimbing anak untuk berbicara secara sabar
            """,
            """
            • Jangan memaksa anak untuk berbicara jika mereka merasa tidak nyaman atau tidak siap
            """,
            """
            • Memberikan pujian atau dukungan saat anak berhasil ataupun tidak dalam mengucapkan kata-kata
            """],
        colorTheme: .primaryBgColor,
        journey: [SectionData.section1M1, SectionData.section2M1, SectionData.section3M1]
    )
    
    static let milestone2 = Milestone(
        id: "milestone2",
        image: Lotties.baby,
        title: "24 - 36 Bulan",
        body: "Pada tahap ini diharapkan sang anak dapat mengucapkan kata “p” , “w”, “z” dan “t” dengan benar.",
        progVal: 0,
        progMaxVal: 15,
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
        colorTheme: .purpleColor,
        journey: [SectionData.section1M1, SectionData.section2M1]
    )
    
    static let milestone3 = Milestone(
        id: "milestone3",
        image: Lotties.baby,
        title: "36 - 48 Bulan",
        body: "Pada tahap ini diharapkan sang anak dapat mengucapkan kata “p” , “w”, “z” dan “t” dengan benar.",
        progVal: 0,
        progMaxVal: 25,
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
        colorTheme: .blueColor,
        journey: [SectionData.section1M1, SectionData.section2M1]
    )
    
}
