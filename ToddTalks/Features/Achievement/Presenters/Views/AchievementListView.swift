//
//  AchievementList.swift
//  ToddTalks
//
//  Created by Fernando Putra on 03/05/23.
//

import SwiftUI
import CoreData

struct AchievementListView: View {
    
    @Environment(\.managedObjectContext) var managedObjContext
    @FetchRequest(sortDescriptors: [SortDescriptor(\.achievementId, order: .reverse)]) var completeAchievement: FetchedResults<CompleteAchievement>
    @Binding var username: String
    @State var starCount = 0

    var body: some View {
        NavigationView{
            ZStack {
                VStack {
                    VStack {
                        Text("Pencapaian\n\(username)")
                            .font(FontProvider.custom(.niceSugar, size: .largeTitle))
                            .multilineTextAlignment(.center)
                            .foregroundColor(.textColor)
                        HStack {
                            Text("\(starCount) / \(achievements.count)")
                                .font(FontProvider.custom(.sassoon, size: .body))
                            Image(systemName: "trophy.fill")
                                .foregroundColor(.primaryColor)
                                .font(.title3)
                                .shimmering()
                                .offset(y: -4)
                        }
                        .padding(.top, -16)
                        Divider()
                        
                    }
                    List {
                        ForEach(achievements) { achievement in
                            AchievementRow(data: achievement,starCount: $starCount)
                                .environment(\.managedObjectContext, managedObjContext)
                        }
                    }
                }
                .listStyle(PlainListStyle())
            }
        }.onAppear{
            checkAchievement()
        }
    }
    
    func checkAchievement(){
        var array : [String] = []
        completeAchievement.forEach{item in
            guard let achievementId = item.achievementId else {return}
            if (!array.contains(achievementId)){
                array.append(achievementId)
                starCount += 1
            }
        }
    }
    
}

struct AchievementList_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            AchievementListView(username: .constant("Sanz"))
        }
    }
}
