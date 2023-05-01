//
//  HintCarousel.swift
//  ToddTalks
//
//  Created by Fernando Putra on 24/04/23.
//

import SwiftUI

struct HintCarousel: View {
    let carouselContent: [String]
    @State private var currentIndex = 0
    
    var body: some View {
        ZStack(alignment: .bottom) {
            IndicatorView(numberOfIndicators: carouselContent.count, currentIndex: currentIndex, indicatorColor: .primaryColor, indicatorSize: 5)
                .padding()
            TabView(selection: $currentIndex) {
                ForEach((0..<carouselContent.count), id: \.self) { index in
                    ScrollView(.vertical,showsIndicators: true) {
                        Text(carouselContent[index])
                            .lineSpacing(4)
                            .font(FontProvider.custom(.niceSugar, size: .caption2))
                            .multilineTextAlignment(.leading)
                            .padding(.top, 4)
                    }
                    .padding()
                    .foregroundColor(.black)
                }
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            .fixedSize(horizontal: false, vertical: false)
            .background(
                RoundedRectangle(cornerRadius: 12, style: .continuous)
                    .strokeBorder(Color(uiColor: .systemGray5), lineWidth: 1)
            )
            .onAppear {
                let timer = Timer.scheduledTimer(withTimeInterval: 8, repeats: true) { _ in
                    withAnimation {
                        currentIndex = (currentIndex + 1) % carouselContent.count
                    }
                }
                RunLoop.current.add(timer, forMode: .common)
            }
        }
        
    }
}

struct HintCarousel_Previews: PreviewProvider {
    static var previews: some View {
        HintCarousel(carouselContent: ["""
        • You're a loyal and caring friend!
        • You're empathetic and have a strong sense of fairness and justice.
        """, "Slide 2", "Slide 3"])
        .frame(width: 300, height: 110)
        .previewLayout(.sizeThatFits)
    }
}

