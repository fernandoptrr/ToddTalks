//
//  HomeView.swift
//  ToddTalks
//
//  Created by Fernando Putra on 17/04/23.
//

import SwiftUI

struct MilestoneView: View  {
    @State var currentIndex: Int = 0
    @StateObject var viewModel = MilestoneViewModel()
    
    var body: some View {
            ZStack{
                viewModel.milestones[currentIndex].colorTheme
                    .ignoresSafeArea()
                    .animation(.easeOut, value: currentIndex )
                VStack{
                    HStack(alignment: .center) {
                        Spacer()
                        Text("KataKecil")
                            .font(FontProvider.custom(.niceSugar, size: .largeTitle))
                            .foregroundColor(.primaryColor)
                        Spacer()
                        NavigationLink(destination: AchievementListView()) {
                            Image(systemName: "trophy.fill")
                                .foregroundColor(.primaryColor)
                                .font(.system(size: 24))
                        }
                        .offset(x: -4, y: -4)
                    }
                    .padding(.horizontal)
                    .padding(.top,24)
                    
                    SnapCarouselView(trailingSpace: 64, index: $currentIndex, items: viewModel.milestones){ milestone in
                        MilestoneCardView(
                            milestone: milestone,
                            illScale: 1.8
                        )
                    }
                    .padding(.top, 64)
                    HStack (spacing: 6){
                        ForEach(viewModel.milestones.indices, id: \.self) { index in
                            Circle()
                                .fill(currentIndex == index ? .primaryColor : Color(.systemGray4))
                                .frame(width: 10, height: 10)
                                .scaleEffect(currentIndex == index ? 1 : 0.8)
                                .animation(.spring(), value: currentIndex == index )
                        }
                    }
                }
            }
        .accentColor(Color(uiColor: .systemGray2))
        .navigationViewStyle(.stack)
        .navigationBarBackButtonHidden()
    }
}


struct MilestoneView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            MilestoneView()
        }
    }
}
