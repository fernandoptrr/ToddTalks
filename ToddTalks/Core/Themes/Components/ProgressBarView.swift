//
//  ProgressBarView.swift
//  ToddTalks
//
//  Created by Fernando Putra on 18/04/23.
//

import SwiftUI

struct ProgressBarView: View {
    var label: String
    var value: Int
    var maximum: Int
    
    var body: some View {
        HStack(alignment: .center) {
            Gauge(value: Double(value), in: 0...Double(maximum)) {}
                .gaugeStyle(.linearCapacity)
                .scaleEffect(x: 1, y: 1.3, anchor: .center)
                .tint(Color.greenColor)
                .overlay(alignment: .center) {
                    Text(label)
                        .font(FontProvider.custom(.sassoon, size: .caption)
                            .weight(.medium))
                }
            Image(systemName: "shippingbox.fill")
                .foregroundColor(.greenColor)
                .font(.title)
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
