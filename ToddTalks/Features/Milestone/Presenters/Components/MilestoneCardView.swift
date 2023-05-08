//
//  MilestoneCard.swift
//  ToddTalks
//
//  Created by Fernando Putra on 17/04/23.
//

import SwiftUI

struct MilestoneCardView: View {
    let milestone: Milestone
    @Binding var username: String
    var illScale: CGFloat = 1.6
    private let offset: CGFloat = 6
    @Environment(\.managedObjectContext) var managedObjContext
    @FetchRequest(sortDescriptors: [SortDescriptor(\.achievementId, order: .reverse)]) var completeAchievement: FetchedResults<CompleteAchievement>
    
    @State var currStar = 0
    
    
    var body: some View {
        ZStack(alignment: .top){
            RoundedRectangle(cornerRadius: 32, style: .continuous)
                .fill(Color(uiColor: .systemGray4))
                .offset(y: offset)
            RoundedRectangle(cornerRadius: 32, style: .continuous)
                .fill(Color.milestoneCardColor)
              
            VStack {
                Text(milestone.title)
                    .font(FontProvider.custom(.niceSugar, size: .title))
                    .padding(.top, 84)
                    .overlay
                    {
                        Image("anakcowo")
                            .resizable()
                            .scaledToFit()
                            .frame( height: 180)
                            .offset(y: -76)
                    }
                Text(milestone.body)
                    .font(FontProvider.custom(.sassoon, size: .body)
                        .weight(.medium))
                    .fixedSize(horizontal: false, vertical: true)
                    .multilineTextAlignment(.center)
                    .padding(.top, 8)
                HStack {
                    ProgressBarView(label: milestone.progLabel, value: currStar, maximum: milestone.progMaxVal, color: .yellow)
                        .foregroundColor(Color(uiColor: .darkGray))
                    NavigationLink(destination: AchievementListView(username: $username)) {
                        Image(systemName: "trophy.fill")
                            .foregroundColor(.primaryColor)
                            .font(.title)
                            .shimmering()

                    }
                }
                .padding(.top, 32)
                HintCarousel(carouselContent: milestone.tips)
                    .frame(height: 100)
                    .padding(.top, 8)
                    .foregroundColor(.black)
                NavigationLink(destination: JourneyView(sections: milestone.journey, colorTheme: milestone.colorTheme) .environment(\.managedObjectContext, managedObjContext)) {
                    Text("Perjalanan")
                }
                .buttonStyle(RaisedButtonStyle())
                .frame(height: 44)
                .foregroundColor(.white)
                .padding()
                .padding(.top, 16)
            }
            .foregroundColor(.primaryColor)
            .padding()
        }
        .fixedSize(horizontal: false, vertical: true).onAppear{
            checkAchievement()
        }
    }
    
    func checkAchievement(){
        var array : [String] = []
        completeAchievement.forEach{item in
            guard let achievementId = item.achievementId else {return}
            if (!array.contains(achievementId)){
                array.append(achievementId)
                currStar += 1
            }
        }
    }
}

struct MilestoneCardView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.primaryBgColor.ignoresSafeArea()
            MilestoneCardView(
                milestone: Milestone(
                    id: "milestone1",
                    image: Lotties.baby,
                    title: "12 - 24 Bulan",
                    body: "Pada tahap ini diharapkan sang anak dapat mengucapkan kata “p” , “w”, “z” dan “t” dengan benar.",
                    progVal: 5,
                    progMaxVal: 30,
                    tips: ["""
                • You're a loyal and caring friend!
                • You're empathetic and have a strong sense of fairness and justice.
                """,
                """
                • You're a loyal and caring friend!
                • You're empathetic and have a strong sense of fairness and justice.
                """,
                """
                • You're a loyal and caring friend!
                • You're empathetic and have a strong sense of fairness and justice.
                """],
                    colorTheme: .purpleColor,
                    journey: [SectionData.section1M1, SectionData.section2M1]
                ), username: .constant("Sanz"),
                illScale: 1.8
            )
            .padding(.horizontal, 32)
            .padding(.vertical, 84)
        }
    }
    

}
