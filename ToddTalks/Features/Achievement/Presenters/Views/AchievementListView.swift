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
    @State var starCount: Int = 0
    var body: some View {
        NavigationView{
            VStack {
                VStack {
                    Text("Achievement")
                        .font(FontProvider.custom(.niceSugar, size: .largeTitle))
                        .foregroundColor(.primaryColor)
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
    }
    
 
    
}

struct AchievementList_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            AchievementListView()
        }
    }
}
