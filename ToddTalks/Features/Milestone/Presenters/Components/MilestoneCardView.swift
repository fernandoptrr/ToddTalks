//
//  MilestoneCard.swift
//  ToddTalks
//
//  Created by Fernando Putra on 17/04/23.
//

import SwiftUI

struct MilestoneCardView: View {
    let offset: CGFloat = 6
    
    var body: some View {
        ZStack(alignment: .top){
            RoundedRectangle(cornerRadius: 32, style: .continuous)
                .fill(Color(uiColor: .systemGray6))
                .offset(y: offset)
            RoundedRectangle(cornerRadius: 32, style: .continuous)
                .fill(.white)
            LottieView(name: Lotties.crab, loopMode: .loop, animationSpeed: 0.8)
                .frame(height: 180)
                .offset(y: -80)
            VStack {
                Text("12 - 24 Months")
                    .font(FontProvider.custom(.niceSugar, size: .title))
                    .padding(.bottom, 8)
                Text("Pada tahap ini diharapkan sang anak dapat mengucapkan kata “p” , “w”, “z” dan “t” dengan benar.")
                    .font(FontProvider.custom(.niceSugar, size: .subheadline))
                    .multilineTextAlignment(.center)
                    .padding(.bottom, 32)
                ProgressBarView(label: "5 / 30 Stars", value: 5, maximum: 30)
                    .padding(.horizontal)
                    .padding(.bottom, 16)
                HintTextView(text: """
        • You're a loyal and caring friend!
        • You're empathetic and have a strong sense of fairness and justice.
        • You're a natural mediator and prefer to avoid conflict, preferring instead to foster harmony and cooperation among those around you.
        """)
                Spacer()
                Button("Journey"){}
                    .buttonStyle(RaisedButtonStyle())
                
                    .frame(maxHeight: 46)
                    .foregroundColor(.white)
                    .padding()
                    .offset(y: -100)
            }
            .padding()
            .offset(y: 100)
        }
    }
}

struct MilestoneCardView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.purpleColor.ignoresSafeArea()
            MilestoneCardView()
                .padding(.horizontal, 32)
                .padding(.vertical, 84)
        }
    }
}
