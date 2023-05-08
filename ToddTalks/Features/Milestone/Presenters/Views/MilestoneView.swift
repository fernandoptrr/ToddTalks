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
    @Environment(\.managedObjectContext) var managedObjContext
    @Binding var username: String
    
    var body: some View {
        NavigationStack {
            ZStack{
                viewModel.milestones[currentIndex].colorTheme
                    .ignoresSafeArea()
                    .animation(.easeOut, value: currentIndex )
                VStack{
                    Text("KataKecil")
                                                .font(FontProvider.custom(.niceSugar, size: .largeTitle))
                                                .foregroundColor(.textColor)
                                                .padding(.top,24)
                    SnapCarouselView(trailingSpace: 64, index: $currentIndex, items: viewModel.milestones){ milestone in
                        MilestoneCardView(milestone: milestone, username: $username) .environment(\.managedObjectContext, managedObjContext)
                    }
                    .padding(.top, 64)
                    HStack (spacing: 6){
                        ForEach(viewModel.milestones.indices, id: \.self) { index in
                            RoundedRectangle(cornerRadius: currentIndex == index ? 24 : 100, style: .continuous)
                                .fill(currentIndex == index ? .primaryColor : Color(.systemGray2))
                                .frame(width: currentIndex == index ? 25 : 10, height: 6)
                                .animation(.spring(), value: currentIndex == index )
                        }
                    }
                }
                if (currentIndex != 0) {
                    ZStack {
                        Color(.black).opacity(0.8)
                        .ignoresSafeArea()
                        Text("Segera Hadir!")
                            .font(FontProvider.custom(.niceSugar, size: .largeTitle))
                            .foregroundColor(.primaryColor)
                            .padding(.top,24)
                    }
                    .animation(.easeInOut(duration: 2), value: currentIndex)
                    .allowsHitTesting(false)
                }
            }
        }
        .navigationBarBackButtonHidden()
    
    }
    
 
}


struct MilestoneView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            MilestoneView(username: .constant("Gilang Sanz"))
        }
    }
}
