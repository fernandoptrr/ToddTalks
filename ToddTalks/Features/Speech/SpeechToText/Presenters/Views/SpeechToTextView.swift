//
//  SpeechToTextView.swift
//  ToddTalks
//
//  Created by Kresna Faza R on 03/05/23.
//

import SwiftUI
import AVFoundation

struct SpeechToTextView: View {
    @State var tapStatus = "Tap to Speak"
    @State var word = ""
    @State var correctState = false
    
    var body: some View {
        VStack {
            Text(tapStatus)
                .bold()
            SpeakButtonView(word: "pisang",isCorrect: $correctState)
            Text(correctState ? "Benar" : "Salah" )
        }
    }
    
   
}

struct SpeechToTextView_Previews: PreviewProvider {
    static var previews: some View {
        SpeechToTextView()
    }
}
