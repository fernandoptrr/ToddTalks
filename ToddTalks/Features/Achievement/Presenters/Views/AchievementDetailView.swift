//
//  AchievementDetailView.swift
//  ToddTalks
//
//  Created by Fernando Putra on 03/05/23.
//

import SwiftUI

struct AchievementDetailView: View {
    let name : String
    let bodyData : String
    let imageData : Data?
    
    var body: some View {
        VStack {
            Text(name).font(.custom("Nice Sugar", size: 30)).bold()
                .foregroundColor(.orange)
                .padding(0)
                .multilineTextAlignment(.center)
            if(imageData != nil) {
                Image(uiImage: UIImage(data: imageData!)!).resizable().frame(width: 320,height: 552)
            }
            Text(bodyData).font(.custom("Nice Sugar", size: 18)).bold()
                .foregroundColor(.orange)
                .padding(0)
                .multilineTextAlignment(.center)
        }
    }
}

struct AchievementDetailView_Previews: PreviewProvider {
    static var previews: some View {
        AchievementDetailView(name: "Complete First Project", bodyData: "I just completed my first project and I'm feeling great!", imageData: nil)
    }
}
