//
//  RaisedButtonStyle.swift
//  ToddTalks
//
//  Created by Fernando Putra on 17/04/23.
//

import SwiftUI

struct RaisedButtonStyle: ButtonStyle {
    let offset: CGFloat = 4
    let radius: CGFloat
    let color: Color
    
    init(radius: CGFloat = 24, color: Color = .primaryColor) {
        self.radius = radius
        self.color = color
    }
    
    func makeBody(configuration: Configuration) -> some View {
        ZStack {
            RoundedRectangle(cornerRadius: radius, style: .continuous)
                .fill(color.opacity(0.6))
                .offset(y: offset)
            RoundedRectangle(cornerRadius: radius, style: .continuous)
                .fill(color)
                .offset(y: configuration.isPressed ? offset : 0)
            configuration.label
                .font(FontProvider.custom(.sassoon, size: .body)
                    .weight(.bold)
                )
                .offset(y: configuration.isPressed ? offset : 0)
        }
    }
}

struct RaisedButtonStyle_Previews: PreviewProvider {
    static var previews: some View {
        Button("Journey"){}
            .frame(maxWidth: 160, maxHeight: 44)
            .foregroundColor(.white)
            .buttonStyle(RaisedButtonStyle())
            .previewLayout(.sizeThatFits)
    }
}
