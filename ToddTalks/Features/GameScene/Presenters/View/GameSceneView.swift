//
//  GameSceneView2.swift
//  ToddTalks
//
//  Created by Fernando Putra on 03/05/23.
//

import SwiftUI

struct GameSceneView: View {
    @Environment(\.dismiss) private var dismiss
    @State private var isAnimating: Bool = false
    @State private var showVideoModal = false

    
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .top) {
                Image("gameSceneBg")
                    .resizable()
                    .ignoresSafeArea()
                MovingCloud(size: 100, isAnimating: $isAnimating)
                    .offset(x: isAnimating ? -(geometry.size.width/2 - 20) : -(geometry.size.width/2), y: 80)
                MovingCloud(size: 160, isAnimating: $isAnimating)
                    .offset(x: isAnimating ? geometry.size.width/2 : geometry.size.width/2 - 64)
                VStack {
                    HStack {
                        Button(action: {
                            dismiss()
                        }){
                            Image(systemName: "xmark")
                                .foregroundColor(Color(uiColor: .darkGray))
                                .font(.title3.bold())
                        }
                        ProgressBarView(label: nil, value: 1, maximum: 3, scale: 0.8)
                            .offset(y: 0)
                            .foregroundColor(Color(uiColor: .systemGray6))
                            .padding(.leading, 8)
                        Text("1 out of 3")
                            .font(FontProvider.custom(.sassoon, size: .callout)
                                .weight(.bold))
                            .foregroundColor(.primaryColor)
                            .padding(.leading, 8)
                            .overlay(alignment: .bottomTrailing){
                                Button( action: {
                                    showVideoModal.toggle()
                                }) {
                                    Image(systemName: "play.circle")
                                        .font(.title)
                                        .fontWeight(.medium)
                                        .foregroundColor(.primaryColor)
                                }
                                .fixedSize(horizontal: true, vertical: true)
                                    .offset(y: 48)
                            }
                        
                    }
                    .padding()
                    Spacer()
                    LottieView(name: Lotties.pisang, loopMode: .loop, animationSpeed: 0.4)
                        .frame(height: 280)
                        .shadow(radius: 1)
                        .overlay(alignment: .top){
                            ZStack {
                                Image("cloud")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(height: 90)
                                    .scaleEffect(x: 1.4)
                                
                                HStack(alignment: .firstTextBaseline) {
                                    Text("Pisang")
                                        .font(FontProvider.custom(.sassoon, size: .title)
                                            .weight(.bold))
                                        .foregroundColor(.red)
                                    Button( action: {
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
                            .offset(y: -120)
                        }
                        .offset(y: 80)
                    Spacer()
                    HStack {
                        Button( action: {
                        }) {
                            Image(systemName: "xmark")
                                .font(.title)
                                .foregroundColor(.white)
                                .padding(12)
                        }
                        .fixedSize(horizontal: true, vertical: true)
                        .buttonStyle(RaisedButtonStyle(color: .red))
                        Button( action: {
                        }) {
                            Image(systemName: "waveform.and.mic")
                                .font(.largeTitle)
                                .foregroundColor(.white)
                                .padding(24)
                        }
                        .fixedSize(horizontal: true, vertical: true)
                        .buttonStyle(RaisedButtonStyle(radius: 100, color: .blue))
                        .padding(.horizontal, 42)
                        Button( action: {
                        }) {
                            Image(systemName: "checkmark")
                                .font(.title)
                                .foregroundColor(.white)
                                .padding(12)
                        }
                        .fixedSize(horizontal: true, vertical: true)
                        .buttonStyle(RaisedButtonStyle(color: .red))
                    }
                    .padding(.bottom, 52)
                    .padding(.horizontal, 24)
                }
            }
        }
        .navigationBarBackButtonHidden(true)
        .onAppear {
            isAnimating = true
        }
        .fullScreenCover(isPresented: $showVideoModal, content: FullScreenModalView.init)
    }
}

struct GameSceneView_Previews: PreviewProvider {
    static var previews: some View {
        GameSceneView()
    }
}
