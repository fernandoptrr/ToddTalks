//
//  TextToSpeechView.swift
//  ToddTalks
//
//  Created by Kresna Faza R on 03/05/23.
//

import SwiftUI
import AVFoundation

struct TextToSpeechView: View {
    let word : String
    @State var counter = 0
    @State var synthesizer = AVSpeechSynthesizer()
    var body: some View {
            Button(action: {
                let utterance = AVSpeechUtterance(string: word)
                utterance.voice = AVSpeechSynthesisVoice(language: "id-ID")
                utterance.rate = counter%2 == 0 ? 0.15 : 0.4
                utterance.volume = 1.0
                utterance.pitchMultiplier = 1.5
                counter += 1
                synthesizer.speak(utterance)
            }) {
                Image(systemName: "speaker.wave.2")
                    .font(.title3)
                    .foregroundColor(.white)
                    .padding(6)
            }
            .fixedSize(horizontal: true, vertical: true)
            .buttonStyle(RaisedButtonStyle(color: .red))
                .padding(.leading, 8)
                .offset(y: -4)
           
    }
}

struct TextToSpeechView_Previews: PreviewProvider {
    static var previews: some View {
        TextToSpeechView(word: "pisang goreng")
    }
}
