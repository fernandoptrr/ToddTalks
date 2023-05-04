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
        VStack{
            Text(word)
                .padding()
            Button(action: {
                let utterance = AVSpeechUtterance(string: word)
                utterance.voice = AVSpeechSynthesisVoice(language: "id-ID")
                utterance.rate = counter%2 == 0 ? 0.15 : 0.4
                utterance.volume = 1.0
                utterance.pitchMultiplier = 1.5
                counter += 1
                synthesizer.speak(utterance)
            }) {
                
                
                Circle()
                    .foregroundColor(.orange)
                    .frame(width: 200)
                    .overlay {
                        VStack {
                            Image(systemName:"speaker")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .padding(50)
                            
                        }
                        .foregroundStyle(.white)
                        .bold()
                    }
            }
            .foregroundColor(.blue)
            .bold()
           
        }
    }
}

struct TextToSpeechView_Previews: PreviewProvider {
    static var previews: some View {
        TextToSpeechView(word: "pisang goreng")
    }
}
