//
//  StageButton.swift
//  ToddTalks
//
//  Created by Angelica Pinonkuan on 25/04/23.
//

import SwiftUI

struct StageButton: View {
    var body: some View {
        
        VStack{
            HStack{
                Image(systemName: "star")
                    .offset(y: 10)
                Image(systemName: "star")
                Image(systemName: "star")
                    .offset(y:10)
            }
            .foregroundColor(.yellow)
            .font(.system(size: 25))
            .shadow(color: .yellow, radius: 0.5)
            
            ZStack{
                Circle()
                    .frame(width:100, height:100)
                    .foregroundColor(.primary)
                    .offset(y:7)
                Circle()
                    .frame(width:100, height:100)
                    .foregroundColor(.blue)
                Image(systemName: "play.fill")
                    .font(.system(size: 40))
                    .foregroundColor(.white)
                
                    
            }
        }
        
    }
}

struct StageButton_Previews: PreviewProvider {
    static var previews: some View {
        StageButton()
    }
}
