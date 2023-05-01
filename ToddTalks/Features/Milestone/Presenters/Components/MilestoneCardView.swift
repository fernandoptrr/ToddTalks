//
//  MilestoneCard.swift
//  ToddTalks
//
//  Created by Fernando Putra on 17/04/23.
//

import SwiftUI

struct MilestoneCardView: View {
    let milestone: Milestone
    var illScale: CGFloat = 1.6
    private let offset: CGFloat = 6
    
    var body: some View {
        ZStack(alignment: .top){
            RoundedRectangle(cornerRadius: 32, style: .continuous)
                .fill(Color(uiColor: .systemGray4))
                .offset(y: offset)
            RoundedRectangle(cornerRadius: 32, style: .continuous)
                .fill(.white)
            VStack {
                Text(milestone.title)
                    .font(FontProvider.custom(.niceSugar, size: .title))
                    .padding(.top, 84)
                    .overlay {
                        LottieView(name: milestone.illPath, loopMode: .loop, animationSpeed: 0.8)
                            .scaleEffect(illScale)
                            .offset(y: -72)
                    }
                Text(milestone.body)
                    .font(FontProvider.custom(.sassoon, size: .body)
                        .weight(.medium))
                    .fixedSize(horizontal: false, vertical: true)
                    .multilineTextAlignment(.center)
                    .padding(.top, 8)
                ProgressBarView(label: milestone.progLabel, value: milestone.progVal, maximum: milestone.progMaxVal)
                    .padding(.top, 32)
                HintCarousel(carouselContent: milestone.tips)
                    .frame(height: 100)
                    .padding(.top, 8)
                    .foregroundColor(.black)
                NavigationLink(destination: JourneyView()) {
                    Text("Journey")
                }
                .buttonStyle(RaisedButtonStyle())
                .frame(height: 44)
                .foregroundColor(.white)
                .padding()
                .padding(.top, 16)
            }
            .foregroundColor(.primaryColor)
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
                milestone: Milestone(
                    illPath: Lotties.baby,
                    title: "12 - 24 Bulan",
                    body: "Pada tahap ini diharapkan sang anak dapat mengucapkan kata “p” , “w”, “z” dan “t” dengan benar.",
                    progVal: 5,
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
                """],
                    colorTheme: .purpleColor),
                illScale: 1.8
            )
            .padding(.horizontal, 32)
            .padding(.vertical, 84)
        }
    }
}
