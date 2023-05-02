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
                LottieView(name: data.illPath, loopMode: .loop, animationSpeed: 0.8)
                    .frame(height: 164)
                    .scaleEffect(1.4)
                Text(data.headline)
                    .font(FontProvider.custom(.sassoon, size: .largeTitle)
                        .weight(.bold)
                    )
                    .multilineTextAlignment(.center)
                    .foregroundColor(.gray)
                Text(data.subHeadline)
                    .font(FontProvider.custom(.sassoon, size: .body)
                        .weight(.medium)
                    )
                    .multilineTextAlignment(.center)
                    .padding(.top, 2)
            }
            .padding(.horizontal)
                Divider()
                    .padding(.vertical, 16)
            VStack(alignment: .leading) {
                Text(data.title)
                    .font(FontProvider.custom(.sassoon, size: .body)
                        .weight(.bold)
                    )
                    .foregroundColor(.primaryColor)
                Text(data.body)
                    .font(FontProvider.custom(.sassoon, size: .subheadline)
                        .weight(.medium)
                    )
                    .padding(.vertical, 4)
                VStack {
                    ForEach(data.tips, id: \.self) { tip in
                        ZStack {
                            SpeechBubble()
                                .stroke(Color(uiColor: .systemGray4), lineWidth: 1)
                            Text(tip)
                                .font(FontProvider.custom(.sassoon, size: .body))
                                .padding()
                        }
                        .padding(.vertical, 8)
                    }
                }
                .padding(.horizontal, 8)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal)
        }
        .padding(.vertical, 32)
        .ignoresSafeArea()
        .presentationDetents([.large, .fraction(0.80)])
        .presentationDragIndicator(.visible)
    }
}

struct SectionDetailSheet_Previews: PreviewProvider {
    static var previews: some View {
        SectionDetailSheet(data: SectionGuideline(illPath: Lotties.baby, headline: "Section 1 Guideline", subHeadline: "Pelajari tips tata bahasa dan frasa kunci untuk unit ini", title: "FRASA KUNCI", body: "Memakai kata jamak", tips: ["Some really long text in the speech bubble over multiple lines.", "Some really long text in the speech bubble over multiple lines.", "Some really long text in the speech bubble over multiple lines."]))
    }
}
