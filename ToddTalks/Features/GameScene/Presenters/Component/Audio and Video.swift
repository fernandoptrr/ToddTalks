//
//  Audio and Video.swift
//  ToddTalks
//
//  Created by Febrian Daniel on 02/05/23.
//

import SwiftUI

struct Audio_and_Video: View {
    var body: some View {
        HStack(spacing: 80){
            Image(systemName: "speaker.wave.2.circle")
                .resizable()
                .frame(width: 50, height: 50)
                .bold()
            Image(systemName: "film.circle")
                .resizable()
                .frame(width: 50, height: 50)
                .bold()
        }
        .foregroundColor(.secondaryButtonColor)
        .frame(width: 310)
        .padding()
    }
}

struct Audio_and_Video_Previews: PreviewProvider {
    static var previews: some View {
        Audio_and_Video()
    }
}
