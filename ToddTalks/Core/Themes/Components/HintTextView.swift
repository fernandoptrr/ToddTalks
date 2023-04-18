//
//  HintTextView.swift
//  ToddTalks
//
//  Created by Fernando Putra on 18/04/23.
//

import SwiftUI

struct HintTextView: View {
    let text: String

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 24, style: .continuous)
                .fill(.thinMaterial.opacity(0.2))
                .shadow(radius: 1)
            VStack(alignment: .leading) {
                Text(text)
                    .lineSpacing(4)
                    .font(FontProvider.custom(.niceSugar, size: .caption))
                    .multilineTextAlignment(.leading)
                    .padding(.top, 4)
            }
            .padding()
            .foregroundColor(.black)
        }
        .fixedSize(horizontal: false, vertical: true)
    }
}

struct HintTextView_Previews: PreviewProvider {
    static var previews: some View {
        HintTextView(text: """
        • You're a loyal and caring friend!
        • You're empathetic and have a strong sense of fairness and justice.
        • You're a natural mediator and prefer to avoid conflict, preferring instead to foster harmony and cooperation among those around you.
        """)
        .previewLayout(.sizeThatFits)
    }
}
