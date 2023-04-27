//
//  MilestoneCard.swift
//  ToddTalks
//
//  Created by Fernando Putra on 17/04/23.
//

import SwiftUI

struct MilestoneCardView: View {
    
//    @EnvironmentObject var data: MilestoneCardData
    var milestoneCard: MilestoneCard
    
    let offset: CGFloat = 6
    
    var body: some View {
        ZStack(alignment: .top){
            RoundedRectangle(cornerRadius: 32, style: .continuous)
                .fill(Color(uiColor: .systemGray6))
                .offset(y: offset)
            RoundedRectangle(cornerRadius: 32, style: .continuous)
                .fill(.white)
            LottieView(name: milestoneCard.animationName, loopMode: .loop, animationSpeed: 0.8)
                .frame(height: 180)
                .offset(y: -80)
            VStack {
                Text("\(milestoneCard.startMonth) - \(milestoneCard.endMonth) Bulan")
                    .font(FontProvider.custom(.niceSugar, size: .title))
                    .padding(.bottom, 8)
                Text(milestoneCard.description)
                    .font(FontProvider.custom(.niceSugar, size: .subheadline))
                    .multilineTextAlignment(.center)
                    .padding(.bottom, 32)
                ProgressBarView(label: "\(milestoneCard.progress) / \(milestoneCard.totalStage) Bintang", value: milestoneCard.progress, maximum: milestoneCard.totalStage)
                    .padding(.horizontal)
                    .padding(.bottom, 16)
                HintTextView(text: milestoneCard.hintText)
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
        .padding(.horizontal, 40)
    }
}

struct MilestoneCardView_Previews: PreviewProvider {
    
//    static let data = MilestoneCardData()
    
    static var previews: some View {
        ZStack {
            Color.purpleColor.ignoresSafeArea()
            MilestoneCardView(milestoneCard: MilestoneCardData().milestoneCard[1])
//                            .environmentObject(data)
        }
    }
}
