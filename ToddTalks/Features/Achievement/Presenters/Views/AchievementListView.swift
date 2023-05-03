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
                Text("2 / 10")
                    .font(FontProvider.custom(.sassoon, size: .callout))
                    .padding(.top, -16)
                Divider()
            }
            List {
                ForEach(achievements) { achievement in
                    NavigationLink(destination: EmptyView()) {
                        AchievementRow(data: achievement)
                    }
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
