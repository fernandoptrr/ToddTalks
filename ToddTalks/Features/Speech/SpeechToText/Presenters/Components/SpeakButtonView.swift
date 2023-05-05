//
//  SpeakButtonView.swift
//  ToddTalks
//
//  Created by Kresna Faza R on 03/05/23.
//

import SwiftUI

struct SpeakButtonView: View {
    let word : String
    @StateObject var speechRecognizer = SpeechRecognizer()
    @State var isRecording = false
    @Binding var isCorrect : Bool
    var animation : Animation {
        isRecording ? Animation.linear
            .repeatForever() : Animation.linear
    }
    var body: some View {
        Button(action: {
            self.isRecording = false
            speechRecognizer.stopTranscribing()
            speechRecognizer.transcript = ""
            self.isCorrect = false
        }) {
            Circle()
                .foregroundColor(.blue)
                .frame(width: 100)
                .scaleEffect(isRecording ? 1.75 : 1)
                .animation(animation)
                .overlay {
                    VStack {
                        Image(systemName: "waveform.and.mic")
                            .font(.largeTitle)
                            .foregroundColor(.white)
                    }
                    .foregroundStyle(.white)
                    .bold()
                }
        }.simultaneousGesture(LongPressGesture(minimumDuration: 0.1).onEnded({_ in
            self.isRecording = true
            checkWord()
            speechRecognizer.startTranscribing()
        }))
        
        
    }
    func checkWord() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            compareWordToTranscript(word: word.lowercased(), transcript: speechRecognizer.transcript.lowercased())
            if (self.isRecording)
            {
                checkWord()
            }
            
        }
    }
    
    func compareWordToTranscript(word : String, transcript: String) {
        let transcriptArr = transcript.split(separator: " ")
        let wordArr = word.split(separator: " ")
        
        print(transcriptArr)
        if(transcriptArr.contains(wordArr)){
            isCorrect = true
            speechRecognizer.stopTranscribing()
        }
        
    }
    
    
}

extension Array where Element: Equatable {
    func contains(subarray: [Element]) -> Bool {
        guard subarray.count <= count else { return false }
        
        for idx in 0 ... count - subarray.count {
            let start = index(startIndex, offsetBy: idx)
            let end = index(start, offsetBy: subarray.count)
            if Array(self[start ..< end]) == subarray { return true }
        }
        return false
    }
}

struct SpeakButtonView_Previews: PreviewProvider {
    static var previews: some View {
        SpeakButtonView(word: "pisang",isCorrect: .constant(false))
    }
}
