//
//  StageView.swift
//  ToddTalks
//
//  Created by Fernando Putra on 25/04/23.
//

import SwiftUI

struct JourneyView: View {
    @State private var showStageDialog = false
    @State private var selectedStage: Stage = StageData.stage1M1U1
    @Environment(\.managedObjectContext) var managedObjContext
    let sections: [Section]
    let colorTheme: Color
    
    var body: some View {
        ZStack {
            ScrollView {
                ZStack {
                    VStack {
                        ForEach(sections) { section in
                            SectionView(
                                data: section,
                                colorTheme: colorTheme,
                                showStageDialog: $showStageDialog,
                                selectedStage: $selectedStage
                            )
                        }
                    }
                    .padding(.top, 48)
                    Image("Burung")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 42)
                        .offset(x: -150, y: 700)
                    Image("Pesawat")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 80)
                        .offset(x: 140, y: -660)
                    Image("BalonUdara")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 64)
                        .offset(y: 220)
                }
            }
            .ignoresSafeArea()
            .background(colorTheme)
            if showStageDialog {
                StageDialog(isPresented: $showStageDialog, stage: selectedStage
                ).environment(\.managedObjectContext, managedObjContext)
            }
        }
        .toolbarBackground(.hidden, for: .navigationBar)
    }
}

struct JourneyView_Previews: PreviewProvider {
    static var previews: some View {
        JourneyView(sections: [SectionData.section1M1, SectionData.section2M1, SectionData.section3M1], colorTheme: .blueColor)
    }
}
