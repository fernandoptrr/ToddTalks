//
//  SectionGuideline.swift
//  ToddTalks
//
//  Created by Fernando Putra on 02/05/23.
//

import Foundation

struct SectionGuideline: Hashable, Identifiable {
    let id = UUID()
    let illPath: String
    let headline: String
    let subHeadline: String
    let title: String
    let body: String
    let tips: [String]
}
