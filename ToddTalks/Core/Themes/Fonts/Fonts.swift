//
//  Fonts.swift
//  ToddTalks
//
//  Created by Fernando Putra on 17/04/23.
//

import SwiftUI

struct FontProvider {
    enum FontType: String {
        case niceSugar = "NiceSugar"
        case sassoon = "SassoonSansStd"
        case sassoonMedium = "SassoonSansStd-Medium"
        case sassoonBold = "SassoonSansStd-Bold"

    }
    
    enum FontSize: CGFloat {
        case body = 17
        case callout = 16
        case caption = 12
        case caption2 = 11
        case footnote = 13
        case largeTitle = 34
        case subheadline = 15
        case title = 28
        case title2 = 22
        case title3 = 20
    }
    
    static func custom(_ font: FontType, size: FontSize) -> Font {
        Font.custom(font.rawValue, size: size.rawValue)
    }
}
