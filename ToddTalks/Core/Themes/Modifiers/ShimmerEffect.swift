//
//  Shimmer.swift
//  ToddTalks
//
//  Created by Fernando Putra on 24/04/23.
//

import SwiftUI

extension View {
    func shimmering() -> some View {
        self.modifier(ShimmerEffect(tint: .yellow, hightLight: .white.opacity(0.4)))
    }
}

struct ShimmerEffect: ViewModifier {
    @State private var moveTo: CGFloat = -0.7
    var tint: Color
    var hightLight: Color
    var blur: CGFloat = 0
    var highlightOpacity: CGFloat = 1
    var speed: CGFloat = 2
    
    func body(content: Content) -> some View {
        content
            .hidden()
            .overlay {
                Rectangle()
                    .fill(tint)
                    .overlay {
                        GeometryReader {
                            let size = $0.size
                            let extraOffset = size.height / 2.5
                            
                            Rectangle()
                                .fill(.linearGradient(colors: [
                                    .white.opacity(0),
                                    hightLight.opacity(highlightOpacity),
                                    .white.opacity(0)
                                ], startPoint: .top, endPoint: .bottom)
                                )
                                .blur(radius: blur)
                                .rotationEffect(.init(degrees: -70))
                                .offset(x: moveTo > 0 ? extraOffset : -extraOffset)
                                .offset(x: size.width * moveTo)
                        }
                    }
                    .mask {
                        content
                    }
            }
            .onAppear {
                DispatchQueue.main.async {
                    moveTo = 0.7
                }
            }
            .animation(.linear(duration: speed).repeatForever(autoreverses: false), value: moveTo)
    }
}

struct ShimmerEffect_Previews: PreviewProvider {
    static var previews: some View {
        Image(systemName: "star.fill")
            .foregroundColor(.yellow)
            .font(.title)
            .shimmering()
            .previewLayout(.sizeThatFits)
    }
}
