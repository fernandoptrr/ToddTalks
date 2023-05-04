//
//  TextBubbleShape.swift
//  ToddTalks
//
//  Created by Fernando Putra on 03/05/23.
//

import SwiftUI

struct TextBubbleShape: Shape {
    enum TailPosition {
        case bottomCenter, original
    }

    private let radius: CGFloat
    private let tailSize: CGFloat
    private let tailPosition: TailPosition

    init(radius: CGFloat = 10, tailPosition: TailPosition = .original) {
        self.radius = radius
        self.tailPosition = tailPosition
        tailSize = 20
    }

    func path(in rect: CGRect) -> Path {
        var path = Path()

        let startPoint: CGPoint
        switch tailPosition {
        case .bottomCenter:
            startPoint = CGPoint(x: rect.midX, y: rect.maxY)
        case .original:
            startPoint = CGPoint(x: rect.minX, y: rect.maxY - radius)
        }

        path.move(to: startPoint)

        if tailPosition == .bottomCenter {
            path.addLine(to: CGPoint(x: rect.midX - tailSize / 2, y: rect.maxY - radius))
            path.addLine(to: CGPoint(x: rect.midX, y: rect.maxY))
            path.addLine(to: CGPoint(x: rect.midX + tailSize / 2, y: rect.maxY - radius))
        }

        path.addArc(
            center: CGPoint(x: rect.maxX - radius, y: rect.minY + radius),
            radius: radius,
            startAngle: Angle(degrees: 270),
            endAngle: Angle(degrees: 0),
            clockwise: false
        )
        path.addArc(
            center: CGPoint(x: rect.maxX - radius, y: rect.maxY - radius),
            radius: radius,
            startAngle: Angle(degrees: 0),
            endAngle: Angle(degrees: 90),
            clockwise: false
        )
        path.addArc(
            center: CGPoint(x: rect.minX + radius, y: rect.maxY - radius),
            radius: radius,
            startAngle: Angle(degrees: 90),
            endAngle: Angle(degrees: 180),
            clockwise: false
        )
        path.addArc(
            center: CGPoint(x: rect.minX + radius, y: rect.minY + radius),
            radius: radius,
            startAngle: Angle(degrees: 180),
            endAngle: Angle(degrees: 270),
            clockwise: false
        )

        return path
    }
    
    func withTailPosition(_ position: TailPosition) -> TextBubbleShape {
        return TextBubbleShape(radius: radius, tailPosition: position)
    }
}


struct TextBubbleShape_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            TextBubbleShape()
                .stroke(Color.gray, lineWidth: 3)
                .frame(width: 300, height: 80)
                .previewLayout(.sizeThatFits)
            
            TextBubbleShape(radius: 20, tailPosition: .bottomCenter)
                .fill(Color.blue)
                .frame(width: 200, height: 120)
                .previewLayout(.sizeThatFits)
        }
    }
}
