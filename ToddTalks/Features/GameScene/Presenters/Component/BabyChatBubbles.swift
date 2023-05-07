//
//  InformationDialog.swift
//  ToddTalks
//
//  Created by Febrian Daniel on 04/05/23.
//

import SwiftUI

struct BabyChatBubbles: View {
    
    let data: BabyChat
    let babyColor: Color = Color.tealColor
    let parentColor: Color = Color.purpleColor
    
    var body: some View {
        GeometryReader { geometry in
            VStack (alignment: .leading){
                HStack {
                    Image(data.babyImage)
                        .resizable()
                        .frame(width: 42, height: 42)
                        .clipShape(Circle())
                        .overlay(
                            Circle()
                                .stroke()
                                .foregroundColor(babyColor)
                        )
                        .padding(.trailing, 8)
                    ZStack {
                        SpeechBubble()
                            .fill(Color.tealColor)
                        Text(data.babyChat)
                            .font(FontProvider.custom(.sassoon, size: .body))
                            .fontWeight(.medium)
                            .lineSpacing(2)
                            .multilineTextAlignment(.leading)
                            .padding()
                    }
                    .frame(width: geometry.size.width/2.3)
                    .frame(minHeight: 64)
                    .fixedSize(horizontal: true, vertical: true)
                }
                
                HStack {
                    Spacer()
                    ZStack {
                        SpeechBubble()
                            .fill(parentColor)
                            .scaleEffect(x: -1, y: 1)
                        Text(data.parentChat)
                            .font(FontProvider.custom(.sassoon, size: .body))
                            .fontWeight(.medium)
                            .lineSpacing(4)
                            .multilineTextAlignment(.trailing)
                            .padding()
                    }
                    .frame(width: geometry.size.width/1.6 )
                    .frame(minHeight: 64)
                    .fixedSize(horizontal: true, vertical: true)
                    Image(data.parentImage)
                        .resizable()
                        .frame(width: 42, height: 42)
                        .clipShape(Circle())
                        .overlay(
                            Circle()
                                .stroke()
                                .foregroundColor(parentColor)
                        )
                        .padding(.leading, 8)
                }
                .padding(.top, 8)
            }
            .foregroundColor(Color(uiColor: .darkGray))
            .padding(.bottom, 8)
        }
        .padding()
    }
}

struct BabyChatBubbles_Previews: PreviewProvider {
    static var previews: some View {
        BabyChatBubbles(data: BabyChat(babyImage: "babyimage", parentImage: "parentimage", babyChat: "Mommy, Pisang itu apa?", parentChat: "Kamu nanyeaa? kamu bertanya tanyeaaa? Follow dulu yeaa"))
    }
}
