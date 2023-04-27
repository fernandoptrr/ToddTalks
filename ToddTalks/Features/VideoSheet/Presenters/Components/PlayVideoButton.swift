//
//  PlayVideoButton.swift
//  ToddTalks
//
//  Created by Angelica Pinonkuan on 25/04/23.
//

import SwiftUI

struct PlayVideoButton: View {
    var body: some View {
        ZStack{
            Circle()
                .frame(width: 100, height: 100)
                .foregroundColor(.secondary)
            Image(systemName: "play.fill")
                .font(.system(size: 40))
            
        }
    }
}

struct PlayVideoButton_Previews: PreviewProvider {
    static var previews: some View {
        PlayVideoButton()
    }
}
