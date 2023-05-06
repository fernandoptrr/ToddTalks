//
//  VideoModalSheetView.swift
//  ToddTalks
//
//  Created by Angelica Pinonkuan on 25/04/23.
//

import SwiftUI
import AVKit
import WebKit


struct FullScreenModalView: View {
 
    @Environment(\.presentationMode) var presentationMode
     
    var body: some View {
        
        VStack{
            
            Button{
                presentationMode.wrappedValue.dismiss()
            } label: {
                HStack{
                    Image(systemName: "chevron.left")
                    Text("Back")
                    Spacer()
                }
            }
            .padding()
            .foregroundColor(.blue)
            
            VideoPlayer(player: AVPlayer(url: Bundle.main.url(forResource: "mamaSong", withExtension: "mp4")!))
                .ignoresSafeArea()
//                    YouTubeView(videoID: "73e3GNxcKvA")
//                        .ignoresSafeArea()
        }
        
    }
}

// Video from Youtube Video
struct YouTubeView: UIViewRepresentable {
    let videoID: String

    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }

    func updateUIView(_ uiView: WKWebView, context: Context) {
        let embedURL = "https://www.youtube.com/embed/\(videoID)"
        let urlRequest = URLRequest(url: URL(string: embedURL)!)
        uiView.load(urlRequest)
    }
}

