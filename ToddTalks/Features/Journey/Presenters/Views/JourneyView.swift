//
//  StageView.swift
//  ToddTalks
//
//  Created by Fernando Putra on 25/04/23.
//

import SwiftUI

struct JourneyView: View {
    @StateObject var viewModel = StageViewModel()
    @State private var showStageDialog = false
    
    var body: some View {
        NavigationStack {
        ZStack {
                ScrollView {
                    VStack {
                        ForEach(0..<3) { index in
                            StageSectionView(
                                headline: "Section 1 (12 - 15 Months)",
                                subHeadline: "Early Word Learning",
                                stages: viewModel.stages,
                                sectionGuideline: viewModel.sectionGuidelines[index],
                                showStageDialog: $showStageDialog
                            )
                        }
                    }
                    .padding(.top, 48)
                }
                .ignoresSafeArea()
                .background(Color.blueColor)
                
                if showStageDialog {
                    StageDialog(isPresented: $showStageDialog, stage: Stage(illPath: "play.fill", title: "Gesture 1", body: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor.", tips: "haha", starCount: 3),     primaryButtonAction: {},
                                secondaryButtonTitle: nil,
                                secondaryButtonAction: nil
                    )
                }
            }
        }
    }
}

struct JourneyView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack{
            JourneyView()
        }
    }
}
