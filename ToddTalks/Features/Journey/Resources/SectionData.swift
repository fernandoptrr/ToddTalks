//
//  UnitData.swift
//  ToddTalks
//
//  Created by Fernando Putra on 05/05/23.
//

import Foundation

struct SectionData {
    static let section1M1: Section = Section(
        id: "section1M1",
        headline: "Bagian 1 (12 - 15 Bulan)",
        subHeadline: "Basic Communication Skill",
        stages: [
            [StageData.stage1M1U1],
            [StageData.stage2M1U1]
        ],
        guideline: SectionGuideline(
            lottie: Lotties.baby,
            headline: "Section 1 Guideline",
            subHeadline: "Pelajari tips tata bahasa dan frasa kunci untuk unit ini",
            title: "FRASA KUNCI",
            body: "Memakai kata jamak",
            tips: [
                "Some really long text in the speech bubble over multiple lines.",
                "Some really long text in the speech bubble over multiple lines.",
                "Some really long text in the speech bubble over multiple lines."
            ]
        )
    )
    
    static let section2M1: Section = Section(
        id: "section2M1",
        headline: "Bagian 2 (16 - 18 Bulan)",
        subHeadline: "Early Word Learning",
        stages: [
            [StageData.stage1M1U2],
            [StageData.stage2M1U2, StageData.stage3M1U2],
            [StageData.stage4M1U2, StageData.stage5M1U2]
        ],
        guideline: SectionGuideline(
            lottie: Lotties.baby,
            headline: "Section 2 Guideline",
            subHeadline: "Pelajari tips tata bahasa dan frasa kunci untuk unit ini",
            title: "FRASA KUNCI",
            body: "Memakai kata jamak",
            tips: [
                "Some really long text in the speech bubble over multiple lines.",
                "Some really long text in the speech bubble over multiple lines.",
                "Some really long text in the speech bubble over multiple lines."
            ]
        )
    )
    
    static let section3M1: Section = Section(
        id: "section3M1",
        headline: "Bagian 3 (19 - 24 Bulan)",
        subHeadline: "Combining Words",
        stages: [
            [StageData.stage1M1U3],
            [StageData.stage2M1U3, StageData.stage3M1U3]
        ],
        guideline: SectionGuideline(
            lottie: Lotties.baby,
            headline: "Section 2 Guideline",
            subHeadline: "Pelajari tips tata bahasa dan frasa kunci untuk unit ini",
            title: "FRASA KUNCI",
            body: "Memakai kata jamak",
            tips: [
                "Some really long text in the speech bubble over multiple lines.",
                "Some really long text in the speech bubble over multiple lines.",
                "Some really long text in the speech bubble over multiple lines."
            ]
        )
    )
}
