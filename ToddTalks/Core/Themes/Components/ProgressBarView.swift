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
        VStack {
            Gauge(value: Double(value), in: 0...Double(maximum)) {}
                .gaugeStyle(.accessoryLinearCapacity)
                .scaleEffect(x: 1, y: 4, anchor: .center)
                .tint(Color.primaryColor)
            Text(label)
                .font(FontProvider.custom(.sassoon, size: .subheadline))
                .multilineTextAlignment(.center)
                .padding(.top, 8)
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
