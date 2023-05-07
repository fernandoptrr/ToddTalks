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
    @Binding var selectedStage: Stage

    private func getStarColor(value: Int) -> Color {
        return stage.starCount >= value ? Color.yellow : Color(uiColor: .systemGray4)
    }

    var body: some View {
        VStack(alignment: .center) {
            HStack {
                if stage.starCount >= 1 {
                    Image(systemName: "star.fill")
                        .foregroundColor(getStarColor(value: 1))
                        .font(.system(size: 18))
                        .rotationEffect(.degrees(45))
                        .shimmering()
                    .offset(y: 8)
                } else {
                    Image(systemName: "star.fill")
                        .foregroundColor(getStarColor(value: 1))
                        .font(.system(size: 18))
                        .rotationEffect(.degrees(45))
                    .offset(y: 8)
                    
                }
                if stage.starCount >= 2 {
                    Image(systemName: "star.fill")
                        .foregroundColor(getStarColor(value: 2))
                        .font(.system(size: 18))
                        .shimmering()
                        .offset(y: -4)
                } else {
                    Image(systemName: "star.fill")
                        .foregroundColor(getStarColor(value: 2))
                        .font(.system(size: 18))
                        .offset(y: -4)
                }
                if stage.starCount >= 3 {
                    Image(systemName: "star.fill")
                        .foregroundColor(getStarColor(value: 3))
                        .font(.system(size: 18))
                        .rotationEffect(.degrees(-45))
                        .shimmering()
                        .offset(y: 8)
                }
                else {
                    Image(systemName: "star.fill")
                        .foregroundColor(getStarColor(value: 3))
                        .font(.system(size: 18))
                        .rotationEffect(.degrees(-45))
                        .offset(y: 8)
                }
                
            }
            Button( action: {
                selectedStage = stage
                showStageDialog.toggle()
            }) {
                Image(systemName: "hand.wave")
                    .font(.system(size: 24))
                    .foregroundColor(.white)
            }
            .frame(width: 48, height: 48)
            .foregroundColor(.white)
            .buttonStyle(RaisedButtonStyle(radius: 100))
            Text(stage.label)
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
        StageCircle(stage: StageData.stage1M1U1,
                    showStageDialog: .constant(false), selectedStage: .constant(StageData.stage1M1U1))
        .previewLayout(.sizeThatFits)
    }
}
