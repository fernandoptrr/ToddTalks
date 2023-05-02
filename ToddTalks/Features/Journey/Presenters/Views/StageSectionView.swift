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
    let sectionGuideline: SectionGuideline
    
    @State private var showDetails = false
    @Binding var showStageDialog: Bool
    
    var body: some View {
        VStack(alignment: .center) {
            ZStack {
                Image("cloud")
                    .resizable()
                    .frame( height: 220)
                
                HStack {
                    VStack(alignment: .leading) {
                        Text(headline)
                            .font(FontProvider.custom(.sassoon, size: .body)
                                .weight(.bold)
                            )
                        Text(subHeadline)
                            .font(FontProvider.custom(.niceSugar, size: .title2))
                            .foregroundColor(.primaryColor)
                            .padding(.top, 4)
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
                        SectionDetailSheet(data: sectionGuideline)
                    }
                }
                .padding(.vertical, 24)
                .padding(.horizontal)
            }
            ForEach(stages, id: \.self) { stageList in
                LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: stageList.count),  alignment: .center){
                    ForEach(stageList, id: \.self) { stage in
                        StageCircle(stage: stage,  showStageDialog: $showStageDialog)
                            .padding(.vertical, 32)
                    }
                }
            }
        }
        .background(Color.blueColor)
    }
}

struct StageSectionView_Previews: PreviewProvider {
    static var previews: some View {
        StageSectionView(
            headline: "Section 1 (12 - 15 Months)",
            subHeadline: "Early Word Learning",
            stages: StageViewModel().stages,
            sectionGuideline: SectionGuideline(illPath: Lotties.baby, headline: "Section 1 Guideline", subHeadline: "Pelajari tips tata bahasa dan frasa kunci untuk unit ini", title: "FRASA KUNCI", body: "Memakai kata jamak", tips: ["Some really long text in the speech bubble over multiple lines.", "Some really long text in the speech bubble over multiple lines.", "Some really long text in the speech bubble over multiple lines."]),
            showStageDialog: .constant(false)
        )
    }
}
