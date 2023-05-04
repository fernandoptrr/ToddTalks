//
//  MovingCloud.swift
//  ToddTalks
//
//  Created by Fernando Putra on 03/05/23.
//

import SwiftUI

struct MovingCloud: View {
    let size: CGFloat
    @Binding var isAnimating: Bool
    
    var body: some View {
        Image("cloud")
            .resizable()
            .scaledToFit()
            .frame(width: size)
            .animation(
                Animation
                    .easeInOut(duration: 12)
                    .repeatForever()
                , value: isAnimating
            )
    }
}

struct MovingCloud_Previews: PreviewProvider {
    static var previews: some View {
        MovingCloud(size: 100, isAnimating: .constant(true))
            .previewLayout(.sizeThatFits)
    }
}
