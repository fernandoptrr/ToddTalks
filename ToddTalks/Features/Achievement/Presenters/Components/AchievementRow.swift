//
//  AchievementRow.swift
//  ToddTalks
//
//  Created by Fernando Putra on 03/05/23.
//

import SwiftUI

struct AchievementRow: View {
    let data: Achievement
    
    @Environment(\.managedObjectContext) var managedObjContext
    @FetchRequest(sortDescriptors: [SortDescriptor(\.achievementId, order: .reverse)]) var completeAchievement: FetchedResults<CompleteAchievement>
    @State var isEmpty = true
    @State var imageData : Data?
    
    var body: some View {
        NavigationLink(destination: AchievementDetailView(name: data.name, bodyData: data.body, imageData: imageData)) {
            HStack {
                AchievementAvatar(imagePath: data.imagePath, color: .primaryColor, isEmpty: isEmpty, size: 24)
                    .padding()
                VStack(alignment: .leading) {
                    Text(data.name)
                    Text(data.date, style: .date)
                        .padding(.top, 2)
                }
                .multilineTextAlignment(.leading)
                Spacer()
            }
        }.disabled(isEmpty)
            .onAppear{
                checkState()
            }
    }
    
    func checkState(){
        completeAchievement.forEach{item in
            if (item.achievementId == data.id) {
                self.isEmpty = false
                self.imageData = item.imageData
            }
        }
    }
}

struct AchievementRow_Previews: PreviewProvider {
    static var previews: some View {
        AchievementRow(data: Achievement(id: 1,imagePath: "achievement1", name: "Completed first project", date: Date(), body: "I just completed my first project and I'm feeling great!"))
    }
}
