//
//  ChatBubble.swift
//  ToddTalks
//
//  Created by Febrian Daniel on 02/05/23.
//

import SwiftUI

struct ChatBubble: View {
    var body: some View {
        ZStack {
            Triangle()
                .fill(.blue)
                .frame(width: 50, height: 50)
                .offset(x: 50, y: -60)
                .rotationEffect(.degrees(-165))
            RoundedRectangle(cornerRadius: 15)
                .frame(width: 170.0, height: 100.0)
                .foregroundColor(.blue)
        }
    }
}

struct Triangle: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()

        path.move(to: CGPoint(x: rect.midX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.midX, y: rect.minY))

        return path
    }
}

struct ChatBubble_Previews: PreviewProvider {
    static var previews: some View {
        ChatBubble()
    }
}
