//
//  HomeView.swift
//  ToddTalks
//
//  Created by Fernando Putra on 17/04/23.
//

import SwiftUI

struct MilestoneView: View {
    @State var showingConfirmationDialog = false

    var body: some View {
        ZStack {
            Button("Journey"){
                showingConfirmationDialog = true
            }
            .buttonStyle(RaisedButtonStyle())
            .frame(maxHeight: 44)
            .foregroundColor(.white)
            .padding()
            .offset(y: -100)
            
            if showingConfirmationDialog {
                StageDialog(
                    isPresented: $showingConfirmationDialog,
                    title: "Learn P, M, L",
                    message: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
                    hintContent: nil,
                    primaryButtonTitle: "Play Now",
                    primaryButtonAction: {},
                    secondaryButtonTitle: nil,
                    secondaryButtonAction: nil,
                    starCount: 3
                )
            }
        }
    }
}

struct MilestoneView_Previews: PreviewProvider {
    static var previews: some View {
        MilestoneView()
    }
}
