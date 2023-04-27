//
//  HomeView.swift
//  ToddTalks
//
//  Created by Fernando Putra on 17/04/23.
//

import SwiftUI

struct MilestoneView: View  {

    @State var currentIndex: Int = 0
    @State var cards: [MilestoneCard] = data


    var body: some View {
        
        ZStack{
            
            Color.pink
                .ignoresSafeArea()

            VStack{
                
                Text("KataKecil")
                    .font(.system(size:40))
                    .padding(.top,20)
                    
                
                SnapCarouselView(trailingSpace: 60, index: $currentIndex, items: cards){ card in

                    GeometryReader { proxy in
                        let size = proxy.size

                        MilestoneCardView(milestoneCard: cards[0])
                            .aspectRatio(CGSize(width: 6.8, height: 10), contentMode: .fill)
                            .frame(width:size.width)
                            .cornerRadius(40)
                            .shadow(color: .gray, radius: 2)
                            
                    }
                }
                .padding(.bottom, 50)
                .padding(.top, 25)

                //indicator
                HStack (spacing: 10){
                    ForEach(cards.indices) { index in
                        Circle()
                            .fill(.black.opacity(currentIndex == index ? 1: 0.1))
                            .frame(width: 10, height: 10)
                            .scaleEffect(currentIndex == index ? 1.4 : 1)
                            .animation(.spring(), value: currentIndex == index )
                    }
                }
            }
        }
    }
}


struct MilestoneView_Previews: PreviewProvider {
    static var previews: some View {
        MilestoneView()
    }
}
