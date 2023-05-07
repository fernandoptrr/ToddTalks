//
//  Unit.swift
//  ToddTalks
//
//  Created by Fernando Putra on 05/05/23.
//

import Foundation

struct Section: Identifiable {
    let id: String
    let headline: String
    let subHeadline: String
    let stages: [[Stage]]
    let guideline: SectionGuideline
}
