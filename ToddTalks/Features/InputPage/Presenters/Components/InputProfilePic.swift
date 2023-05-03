//
//  InputProfilePic.swift
//  ToddTalks
//
//  Created by Angelica Pinonkuan on 02/05/23.
//

import SwiftUI

struct InputProfilePic: View {
    var body: some View {
        ZStack{
            Circle()
                .frame(width: 200)
                .foregroundColor(.gray)
            Image(systemName: "camera")
                .font(.system(size: 60))
                .foregroundColor(.white)
        }
    }
}

struct InputProfilePic_Previews: PreviewProvider {
    static var previews: some View {
        InputProfilePic()
    }
}
