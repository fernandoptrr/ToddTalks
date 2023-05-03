//
//  AchievementRow.swift
//  ToddTalks
//
//  Created by Fernando Putra on 03/05/23.
//

import SwiftUI

struct AchievementRow: View {
    let data: Achievement
    
    var body: some View {
        HStack {
            AchievementAvatar(imagePath: data.imagePath, color: .primaryColor, isEmpty: data.isEmpty, size: 24)
                .padding()
            VStack(alignment: .leading) {
                Text(data.name)
                Text(data.date, style: .date)
                    .padding(.top, 2)
            }
            .multilineTextAlignment(.leading)
            Spacer()
        }
    }
}

struct AchievementRow_Previews: PreviewProvider {
    static var previews: some View {
        AchievementRow(data: Achievement(imagePath: "achievement1", name: "Completed first project", date: Date(), body: "I just completed my first project and I'm feeling great!"))
    }
}
