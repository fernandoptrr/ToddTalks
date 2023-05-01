//
//  StageView.swift
//  ToddTalks
//
//  Created by Fernando Putra on 25/04/23.
//

import SwiftUI

struct JourneyView: View {
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    Text("My Learning Path")
                        .font(.title)
                        .bold()
                    Spacer()
                }
                .padding(.horizontal)
                ScrollView {
                    VStack {
                        ForEach(0..<3) { unit in
                            SectionView(unit: unit)
                        }
                    }
                }
            }
            .navigationTitle("")
            .navigationBarHidden(true)
        }
    }
}

struct SectionView: View {
    var stages: [[Stage]] = [
        [Stage(name: "Gesture")],
        [Stage(name: "Body Language 1"), Stage(name: "Body Language 2")],
        [Stage(name: "Turn 2"), Stage(name: "Turn 3dddddddd"), Stage(name: "Turn 3")],
        [Stage(name: "Review")]
    ]
    
    var unit: Int
    
    var body: some View {
        VStack(alignment: .center) {
            HStack {
                VStack(alignment: .leading) {
                    Text("Section 1 (12 - 15 Months)")
                        .font(FontProvider.custom(.niceSugar, size: .body))
                    Text("Early Word Learning")
                        .font(FontProvider.custom(.niceSugar, size: .callout))
                        .padding(.top, 4)
                }
                Spacer()
                Button(action: {}, label: {
                    Image(systemName: "book.fill")
                        .font(.title2)
                        .padding(.vertical, 8)
                })
                .buttonStyle(.bordered)
            }
            .padding(.vertical, 24)
            .padding(.horizontal)
            .foregroundColor(.white)
            .background(Color(uiColor: .systemGreen))
            .padding(.bottom, 16)
            
            ForEach(stages, id: \.self) { stages in
                LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: stages.count),  alignment: .center, spacing: 16){
                    ForEach(stages, id: \.self) { stage in
                        VStack(alignment: .center) {
                            StageCircle(stage: stage)
                                .padding(.bottom, 4)
                            Text(stage.name)
                                .multilineTextAlignment(.center)
                                .fixedSize(horizontal: false, vertical: true)
                                .lineLimit(3)
                            Spacer(minLength: 0)
                        }
                        .padding(.vertical, 32)
                    }
                }
            }
        }
    }
}

struct SectionView_Previews: PreviewProvider {
    static var previews: some View {
        SectionView(unit: 3)
    }
}

struct JourneyView_Previews: PreviewProvider {
    static var previews: some View {
        JourneyView()
    }
}
