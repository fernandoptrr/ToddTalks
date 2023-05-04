//
//  ProgressBarView.swift
//  ToddTalks
//
//  Created by Fernando Putra on 18/04/23.
//

import SwiftUI

struct ProgressBarView: View {
    let label: String?
    let value: Int
    let maximum: Int
    var scale: CGFloat = 1.3
    var color: Color = Color.primaryColor
    
    
    var body: some View {
        Gauge(value: Double(value), in: 0...Double(maximum)) {}
            .gaugeStyle(.linearCapacity)
            .scaleEffect(x: 1, y: scale, anchor: .center)
            .tint(color)
            .overlay(alignment: .center) {
                if let label = label {
                    Text(label)
                        .font(FontProvider.custom(.sassoon, size: .caption)
                            .weight(.medium))
                }
            }
            .animation(.spring(), value: value)
    }
}

struct ProgressBarView_Previews: PreviewProvider {
    static var previews: some View {
        ProgressBarView(
            label: "5 / 30 Stars",
            value: 1,
            maximum: 5)
    }
}
