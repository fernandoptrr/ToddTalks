//
//  InformationDialog.swift
//  ToddTalks
//
//  Created by Febrian Daniel on 04/05/23.
//

import SwiftUI

struct InformationDialog: View {
    
    let babyText: String
    let parentText: String
    let babyImage: String
    let parentImage: String
    let babyColor: Color = Color.tealColor
    let parentColor: Color = Color.purpleColor
    
    var body: some View {
        GeometryReader { geometry in
            VStack (alignment: .leading){
                HStack {
                    Image(babyImage)
                        .resizable()
                        .frame(width: 32, height: 32)
                        .clipShape(Circle())
//                        .overlay(
//                            Circle()
//                                .stroke()
//                                .foregroundColor(babyColor)
//                        )
                        .padding(.trailing, 8)
                    ZStack {
                        SpeechBubble()
                            .fill(Color.tealColor)
//                            .stroke(babyColor, lineWidth: 1)
//                            .background(.white)
                        
                        Text(babyText)
                            .font(FontProvider.custom(.sassoon, size: .body))
                            .padding()
                    }
                    .frame(width: geometry.size.width/2)
                    .frame(minHeight: 64)
//                    .frame(minWidth: geometry.size.width/2, maxWidth: geometry.size.width/2, minHeight: 68)
                    .fixedSize(horizontal: true, vertical: true)
                }
                
                HStack {
                    Spacer()
                    ZStack {
                        SpeechBubble()
                            .fill(parentColor)
//                            .stroke(parentColor, lineWidth: 1)
                            .scaleEffect(x: -1, y: 1)
                        
                        Text(parentText)
                            .font(FontProvider.custom(.sassoon, size: .title3))
                            .multilineTextAlignment(.trailing)
                            .padding()
                    }
                    .frame(width: geometry.size.width/1.6 )
                    .frame(minHeight: 64)
                    .fixedSize(horizontal: true, vertical: true)
                    Image(parentImage)
                        .resizable()
                        .frame(width: 32, height: 32)
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
            .foregroundColor(.white)
            .padding(.bottom, 8)
        }
        .padding()
    }
}

struct InformationDialog_Previews: PreviewProvider {
    static var previews: some View {
        InformationDialog(babyText: "", parentText: "", babyImage: "", parentImage: "")
    }
}
