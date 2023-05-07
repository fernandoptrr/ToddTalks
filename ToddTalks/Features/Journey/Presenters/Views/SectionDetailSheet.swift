//
//  SectionDetailSheet.swift
//  ToddTalks
//
//  Created by Fernando Putra on 02/05/23.
//

import SwiftUI

struct SectionDetailSheet: View {
    let data: SectionGuideline
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack{
                LottieView(name: data.lottie, loopMode: .loop, animationSpeed: 0.8)
                    .frame(height: 164)
                    .scaleEffect(1.4)
                Text(data.headline)
                    .font(FontProvider.custom(.sassoon, size: .largeTitle)
                        .weight(.bold)
                    )
                    .multilineTextAlignment(.center)
                    .foregroundColor(.primaryColor)
                Text(data.subHeadline)
                    .font(FontProvider.custom(.sassoon, size: .body)
                        .weight(.medium)
                    )
                    .multilineTextAlignment(.center)
                    .padding(.top, 2)
            }
            Divider()
                .padding(16)
            
            VStack {
                ForEach(data.tips, id: \.self) { tip in
                    ZStack {
                        SpeechBubble()
                            .stroke(Color(uiColor: .systemGray4), lineWidth: 1)
                        ScrollView {
                            Text(tip)
                                .font(FontProvider.custom(.sassoon, size: .callout))
                        }
                        .padding()
                    }
                    .padding(.vertical, 8)
                }
                .padding(.horizontal, 8)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        }
        .padding(.horizontal)
        .padding(.vertical, 32)
        .ignoresSafeArea()
        .presentationDetents([.large, .fraction(0.80)])
        .presentationDragIndicator(.visible)
    }
}

struct SectionDetailSheet_Previews: PreviewProvider {
    static var previews: some View {
        SectionDetailSheet(data: SectionData.section1M1.guideline)
    }
}
