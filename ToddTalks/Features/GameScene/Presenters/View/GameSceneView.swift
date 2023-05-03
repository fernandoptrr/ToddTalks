//
//  GameSceneView.swift
//  ToddTalks
//
//  Created by Febrian Daniel on 02/05/23.
//

import SwiftUI

struct GameSceneView: View {
    
    let teks: String
    let animasi: String
    
    var body: some View {
        ZStack {
            Color.tealColor
                .ignoresSafeArea()
            LottieView(name: animasi, loopMode: .loop, animationSpeed: 0.4)
                .frame(height: 350)
                .offset(x: -10, y: 30)
                .shadow(radius: 10)
            ChatBubble()
                .offset(x: 50, y: -170)
                .shadow(radius: 5)
            Text(teks)
                .font(.custom("Nice Sugar", size: 40))
                .offset(x: 50, y: -170)
                .foregroundColor(.white)
            VStack{
                HStack {
                    Image(systemName: "chevron.left")
                        .resizable()
                        .frame(width: 15, height: 22)
                    Spacer()
                }
                .frame(width: 360)
                .foregroundColor(.white)
                .bold()
                Checkmark()
                Spacer()
                Audio_and_Video()
            }
        }
    }
}

struct GameSceneView_Previews: PreviewProvider {
    static var previews: some View {
        GameSceneView(teks: "Senyum", animasi: Lotties.senyum
        )
    }
}
