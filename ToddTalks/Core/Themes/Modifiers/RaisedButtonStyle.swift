//
//  RaisedButtonStyle.swift
//  ToddTalks
//
//  Created by Fernando Putra on 17/04/23.
//

import SwiftUI

struct RaisedButtonStyle: ButtonStyle {
    let offset: CGFloat = 4
    
    func makeBody(configuration: Configuration) -> some View {
        ZStack {
            RoundedRectangle(cornerRadius: 24, style: .continuous)
                .fill(Color.primaryColor.opacity(0.6))
                .offset(y: offset)
            RoundedRectangle(cornerRadius: 24, style: .continuous)
                .fill(Color.primaryColor)
                .offset(y: configuration.isPressed ? offset : 0)
            configuration.label
                .font(FontProvider.custom(.sassoonBold, size: .body))
                .offset(y: configuration.isPressed ? offset : 0)
        }
    }
}

struct RaisedButtonStyle_Previews: PreviewProvider {
    static var previews: some View {
        Button("Journey"){}
            .frame(maxWidth: 160, maxHeight: 40)
            .foregroundColor(.white)
            .buttonStyle(RaisedButtonStyle())
            .previewLayout(.sizeThatFits)
    }
}
