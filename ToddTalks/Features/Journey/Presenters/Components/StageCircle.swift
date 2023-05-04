//
//  StageCircle.swift
//  ToddTalks
//
//  Created by Fernando Putra on 25/04/23.
//

import SwiftUI

struct StageCircle: View {
    let stage: Stage
    @Binding var showStageDialog: Bool
    
    private func getStarIc(value: Int) -> String {
        return stage.starCount >= value ? "star.fill" : "star"
    }
    
    var body: some View {
        VStack(alignment: .center) {
            HStack {
                Image(systemName: getStarIc(value: 1))
                    .foregroundColor(.yellow)
                    .font(.system(size: 18))
                    .rotationEffect(.degrees(45))
                    .shimmering()
                    .offset(y: 8)
                Image(systemName: getStarIc(value: 2))
                    .foregroundColor(.yellow)
                    .font(.system(size: 18))
                    .shimmering()
                    .offset(y: -4)
                Image(systemName: getStarIc(value: 3))
                    .foregroundColor(.yellow)
                    .font(.system(size: 18))
                    .rotationEffect(.degrees(-45))
                    .shimmering()
                    .offset(y: 8)
            }
            .shadow(color: .yellow ,radius: 4)
            Button( action: {
                showStageDialog.toggle()
            }) {
                Image(systemName: "hand.wave")
                    .font(.system(size: 24))
                    .foregroundColor(.white)
            }
            .frame(width: 48, height: 48)
            .foregroundColor(.white)
            .buttonStyle(RaisedButtonStyle(radius: 100))
            Text(stage.title)
                .font(FontProvider.custom(.sassoon, size: .body).weight(.medium))
                .multilineTextAlignment(.center)
                .fixedSize(horizontal: false, vertical: true)
                .lineSpacing(8)
                .lineLimit(3)
                .padding(.top, 4)
            Spacer()
        }
    }
}

struct StageCircle_Previews: PreviewProvider {
    static var previews: some View {
        StageCircle(stage: Stage(illPath: "play.fill", title: "Gesture 1", body: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor.", tips: "haha", starCount: 3),
                    showStageDialog: .constant(false))
        .previewLayout(.sizeThatFits)
    }
}
