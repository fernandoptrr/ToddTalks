//
//  SnapCarouselView.swift
//  ToddTalks
//
//  Created by Angelica Pinonkuan on 22/04/23.
//

import SwiftUI

//To for accepting list

//The Content type represents the type of the view that will be displayed inside the carousel

//The T type represents the type of the data that will be used to populate the carousel.

struct SnapCarouselView <Content: View, T: Identifiable> : View {

    var content: (T) -> Content
    //This closure is typically used to generate the content of the carousel, by taking each item of type T and transforming it into a view of type Content. The resulting views are then displayed in the carousel.

    var list: [T]

    //Properties...
    var spacing: CGFloat
    var trailingSpace: CGFloat

    @Binding var index: Int

    init(spacing: CGFloat = 15, trailingSpace: CGFloat = 100, index: Binding<Int>, items : [T], @ViewBuilder content: @escaping(T)-> Content){
        //index: A binding to an Int value that represents the current index of the carousel.
        //The content parameter is a @ViewBuilder closure that takes a value of type T and returns a Content view. This closure is used to generate the content of the carousel, and is called once for each item in the items array. The resulting Content views are then displayed in the carousel.

        self.list = items
        self.spacing = spacing
        self.trailingSpace = trailingSpace
        self._index = index
        self.content = content
    }


    @GestureState var offset : CGFloat = 0
    @State var currentIndex : Int = 0

    var body: some View{

        //GeometryReader is a view in SwiftUI that provides the size and position of its parent view, which can be used to adjust the layout of child views.
        GeometryReader { proxy in

            //Setting correct width for snap carousel...

            //One Sided Snap Carousel...
            let width = proxy.size.width - (trailingSpace - spacing)

            let adjustMentWidth = (trailingSpace/2) - spacing

            HStack (spacing: spacing){
                ForEach(list){item in
                    content(item)
                        .frame(width: proxy.size.width - trailingSpace)
                }
            }
            .padding(.horizontal, spacing)
            //setting only after 0th index...
            .offset(x: (CGFloat(currentIndex) * -width) + adjustMentWidth + offset)
            .gesture(
                DragGesture()
                    .updating($offset, body: {value, out, _index in
                        out = value.translation.width
                    })
                    .onEnded({ value in
                        //Updating Current Index
                        let offsetX = value.translation.width

                        //were going to translation into progress (0-1) and round the value...

                        //based on the progress increasing or decreasing the currentIndex...

                        let progress = -offsetX / width

                        let roundIndex = progress.rounded()

                        //setting max..
                        currentIndex = max(min(currentIndex + Int(roundIndex), list.count - 2), 0)

                        //updating index...
                        currentIndex = index
                    })
                    .onChanged({ value in
                        //updating only index...
                        let offsetX = value.translation.width

                        //were going to translation into progress (0-1) and round the value...

                        //based on the progress increasing or decreasing the currentIndex...

                        let progress = -offsetX / width

                        let roundIndex = progress.rounded()

                        //setting max..
                        index = max(min(currentIndex + Int(roundIndex), list.count - 1), 0)

                    })
            )
        }
        .animation(.easeInOut, value: offset == 0 )
    }

}

struct SnapCarouselView_Previews: PreviewProvider {
    static var previews: some View {
        MilestoneCardView(
            milestone: Milestone(
                id: "milestone1",
                image: Lotties.baby,
                title: "12 - 24 Bulan",
                body: "Pada tahap ini diharapkan sang anak dapat mengucapkan kata “p” , “w”, “z” dan “t” dengan benar.",
                progVal: 5,
                progMaxVal: 30,
                tips: ["""
            • You're a loyal and caring friend!
            • You're empathetic and have a strong sense of fairness and justice.
            """,
            """
            • You're a loyal and caring friend!
            • You're empathetic and have a strong sense of fairness and justice.
            """,
            """
            • You're a loyal and caring friend!
            • You're empathetic and have a strong sense of fairness and justice.
            """],
                colorTheme: .purpleColor,
                journey: [SectionData.section1M1, SectionData.section2M1]
            ), username: .constant("Sanz")
        )
    }
}
