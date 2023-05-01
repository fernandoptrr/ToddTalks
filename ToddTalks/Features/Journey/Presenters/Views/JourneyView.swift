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
        ZStack {
            NavigationStack {
                ScrollView {
                    VStack {
                        ForEach(0..<3) { unit in
                            StageSectionView(
                                headline: "Section 1 (12 - 15 Months)",
                                subHeadline: "Early Word Learning",
                                stages: viewModel.stagses,
                                showStageDialog: $showStageDialog
                            )
                        }
                    }
                }
            }
            if showStageDialog {
                StageDialog(isPresented: $showStageDialog, stage: Stage(illPath: "play.fill", title: "Gesture 1", body: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor.", tips: "haha", starCount: 3),     primaryButtonAction: {},
                            secondaryButtonTitle: nil,
                            secondaryButtonAction: nil
                )
            }
        }
        .navigationBarHidden(true)
    }
}

struct JourneyView_Previews: PreviewProvider {
    static var previews: some View {
        JourneyView()
    }
}
