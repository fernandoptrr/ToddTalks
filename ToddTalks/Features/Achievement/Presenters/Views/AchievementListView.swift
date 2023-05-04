//
//  AchievementList.swift
//  ToddTalks
//
//  Created by Fernando Putra on 03/05/23.
//

import SwiftUI

struct AchievementListView: View {
    var body: some View {
        VStack {
            VStack {
                Text("Achievement")
                    .font(FontProvider.custom(.niceSugar, size: .largeTitle))
                    .foregroundColor(.primaryColor)
                HStack {
                    Text("2 / 10")
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
                    NavigationLink(destination: EmptyView()) {
                        AchievementRow(data: achievement)
                    }
                    .disabled(achievement.isEmpty)
                }
            }
        }
        .listStyle(PlainListStyle())
    }
}

struct AchievementList_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            AchievementListView()
        }
    }
}
