//
//  MilestoneCard.swift
//  ToddTalks
//
//  Created by Fernando Putra on 17/04/23.
//

import SwiftUI

struct MilestoneCardView: View {
    let illSrc: String
    let headline: String
    let subHeadline: String
    let progLabel: String
    let progVal: Int
    let progMaxVal: Int
    let tips: [String]
    
    private let offset: CGFloat = 6
    
    var body: some View {
        ZStack(alignment: .top){
            RoundedRectangle(cornerRadius: 32, style: .continuous)
                .fill(Color(uiColor: .systemGray4))
                .offset(y: offset)
            RoundedRectangle(cornerRadius: 32, style: .continuous)
                .fill(.white)
            VStack {
                Text(headline)
                    .font(FontProvider.custom(.niceSugar, size: .title))
                    .padding(.top, 84)
                    .overlay {
                        LottieView(name: illSrc, loopMode: .loop, animationSpeed: 0.8)
                            .frame(height: 180)
                            .offset(y: -72)
                    }
                Text(subHeadline)
                    .font(FontProvider.custom(.niceSugar, size: .subheadline))
                    .fixedSize(horizontal: false, vertical: true)
                    .multilineTextAlignment(.center)
                    .padding(.top, 8)
                ProgressBarView(label: progLabel, value: progVal, maximum: progMaxVal)
                    .padding(.top, 32)
                HintCarousel(carouselContent: tips)
                    .frame(height: 100)
                    .padding(.top, 8)
                Button("Journey"){}
                    .buttonStyle(RaisedButtonStyle())
                    .frame(height: 44)
                    .foregroundColor(.white)
                    .padding()
                    .padding(.top, 16)
            }
            .padding()
        } 
        .fixedSize(horizontal: false, vertical: true)
    }
}

struct MilestoneCardView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.blueColor.ignoresSafeArea()
            MilestoneCardView(
                illSrc: Lotties.crab,
                headline: "12 - 24 Months",
                subHeadline: "Pada tahap ini diharapkan sang anak dapat mengucapkan kata “p” , “w”, “z” dan “t” dengan benar.",
                progLabel: "5 / 30 Stars",
                progVal: 12,
                progMaxVal: 30,
                tips: ["""
                • You're a loyal and caring friend!
                • You're empathetic and have a strong sense of fairness and justice.
                """,
                """
                • You're a loyal and caring friend!
                • You're empathetic and have a strong sense of fairness and justice.
                """,
                """
                • You're a loyal and caring friend!
                • You're empathetic and have a strong sense of fairness and justice.
                """]
            )
            .padding(.horizontal, 32)
            .padding(.vertical, 84)
        }
    }
}
