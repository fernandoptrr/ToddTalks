//
//  JourneySectionView.swift
//  ToddTalks
//
//  Created by Fernando Putra on 02/05/23.
//

import SwiftUI

struct SectionView: View {
    let data: Section
    let colorTheme: Color
    
    @State private var showDetails = false
    @Binding var showStageDialog: Bool
    @Binding var selectedStage: Stage

    
    var body: some View {
        VStack(alignment: .center) {
            ZStack {
                Image("cloudBig")
                    .resizable()
                    .frame( height: 180)
                
                
                
                HStack {
                    VStack(alignment: .leading) {
                        Text(data.headline)
                            .font(FontProvider.custom(.sassoon, size: .body)
                                .weight(.medium)
                            )
                        Text(data.subHeadline)
                            .font(FontProvider.custom(.niceSugar, size: .title2))
                            .foregroundColor(.primaryColor)
                            .padding(.top, 2)
                    }
                    Spacer()
                    Button(action: {
                        showDetails.toggle()
                    }, label: {
                        Image(systemName: "book.fill")
                            .font(.title2)
                            .padding(.vertical, 8)
                            .foregroundColor(.white)
                    })
                    .buttonStyle(.bordered)
                    .background(Color.primaryColor)
                    .cornerRadius(12)
                    .sheet(isPresented: $showDetails) {
                        SectionDetailSheet(data: data.guideline)
                    }
                }
                .padding(.vertical, 24)
                .padding(.horizontal)
            }
            ForEach(data.stages, id: \.self) { stageList in
                LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: stageList.count),  alignment: .center){
                    ForEach(stageList, id: \.self) { stage in
                        StageCircle(stage: stage,  showStageDialog: $showStageDialog,
                        selectedStage: $selectedStage)
                            .padding(.vertical, 32)
                    }
                }
            }
        }
        .background(colorTheme)
    }
}

struct StageSectionView_Previews: PreviewProvider {
    static var previews: some View {
        SectionView(
            data: SectionData.section1M1,
            colorTheme: .blueColor, showStageDialog: .constant(false),
            selectedStage: .constant(StageData.stage1M1U1)
        )
    }
}
