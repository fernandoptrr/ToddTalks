//
//  JourneySectionView.swift
//  ToddTalks
//
//  Created by Fernando Putra on 02/05/23.
//

import SwiftUI

struct StageSectionView: View {
    let headline: String
    let subHeadline: String
    let stages: [[Stage]]
    
    @Binding var showStageDialog: Bool
    
    var body: some View {
        VStack(alignment: .center) {
            HStack {
                VStack(alignment: .leading) {
                    Text(headline)
                        .font(FontProvider.custom(.niceSugar, size: .body))
                    Text(subHeadline)
                        .font(FontProvider.custom(.niceSugar, size: .callout))
                        .padding(.top, 4)
                }
                Spacer()
                Button(action: {
                }, label: {
                    Image(systemName: "book.fill")
                        .font(.title2)
                        .padding(.vertical, 8)
                })
                .buttonStyle(.bordered)
            }
            .padding(.vertical, 24)
            .padding(.horizontal)
            .foregroundColor(.white)
            .background(Color(uiColor: .systemGreen))
            ForEach(stages, id: \.self) { stageList in
                LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: stageList.count),  alignment: .center){
                    ForEach(stageList, id: \.self) { stage in
                        StageCircle(stage: stage,  showStageDialog: $showStageDialog)
                            .padding(.vertical, 32)
                    }
                }
            }
            .padding(.top, 16)
        }
    }
}

struct StageSectionView_Previews: PreviewProvider {
    static var previews: some View {
        StageSectionView(
            headline: "Section 1 (12 - 15 Months)",
            subHeadline: "Early Word Learning",
            stages: StageViewModel().stagses,
            showStageDialog: .constant(false)
        )
    }
}
