//
//  CircleImage.swift
//  ToddTalks
//
//  Created by Fernando Putra on 03/05/23.
//

import SwiftUI

struct AchievementAvatar: View {
    let imagePath: String
    let color: Color
    var isEmpty: Bool = false
    var size: CGFloat = 32
    let lottie: String
    
    var body: some View {
        if isEmpty {
            emptyView
        } else {
            imageView
        }
    }
    
    var emptyView: some View {
        Text("?")
            .font(FontProvider.custom(.niceSugar, size: .title))
            .foregroundColor(Color(uiColor: .systemGray4))
            .frame(width: size, height: size)
            .padding()
            .overlay(
                Circle()
                    .stroke(style: StrokeStyle(lineWidth: 2, dash: [8]))
                    .foregroundColor(Color(uiColor: .systemGray4))
            )
    }
    
    var imageView: some View {
        Image(imagePath)
            .resizable()
            .frame(width: size, height: size)
            .padding()
            .background(color)
            .clipShape(Circle())
            .overlay {
                LottieView(name: lottie, loopMode: .loop, animationSpeed: 1).padding(4)
            }
    }
}

struct AchievementAvatar_Previews: PreviewProvider {
    static var previews: some View {
        AchievementAvatar(imagePath: "blabla", color: Color.primaryColor, isEmpty: false,lottie: Lotties.bye)
            .previewLayout(.sizeThatFits)
    }
}
