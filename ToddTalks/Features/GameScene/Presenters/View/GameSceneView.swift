//
//  GameSceneView2.swift
//  ToddTalks
//
//  Created by Fernando Putra on 03/05/23.
//

import SwiftUI

struct GameSceneView: View {
    @EnvironmentObject private var viewModel: GameViewModel
    @State private var isAnimating: Bool = false
    @State private var showVideoModal: Bool = false
    @State private var isCorrect: Bool = false
    @StateObject private var achievementController = AchievementController()
    
    let stageId : String
    let outline : String
    @State var starState = 0
    
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .top) {
                NavigationLink(destination:
                                CameraContentView(outline: outline).environment(\.managedObjectContext, achievementController.container.viewContext),
                               isActive: .constant(viewModel.reachedEnd)) {
                    EmptyView()
                }.simultaneousGesture(TapGesture().onEnded{
                    
                })
                GameBackround(isAnimating: $isAnimating, width: geometry.size.width)
                VStack {
                    GameHeader(currentIndex: viewModel.currentGameIndex, gameLength: viewModel.games.count, babyChat: viewModel.games[viewModel.currentGameIndex].infoScene, isInfoScene: viewModel.isInfoScene, showVideoModal: $showVideoModal)
                    Spacer()
                    GameContent(lottie: viewModel.games[viewModel.currentGameIndex].lottie, content: viewModel.games[viewModel.currentGameIndex].content, isInfoScene: viewModel.isInfoScene)
                    Spacer()
                    GameFooter(isCorrect: $isCorrect, starState: $starState, stageId: stageId, content: viewModel.games[viewModel.currentGameIndex].content )
                }
            }
            if (isCorrect){
                ZStack{
                    VStack {
                        Spacer()
                        HStack{
                            Spacer()
                            Text("Benar!").font(.custom("Nice Sugar", size: 80)).bold()
                                .foregroundColor(.green)
                                .padding(0)
                            Spacer()
                        }
                        Spacer()
                    }
                    LottieView(name: Lotties.confetti, loopMode: .loop, animationSpeed: 1)
                }.onAppear{
                    playSound(sound: "correct1", type: "mp3")
                }
            }
        }
        .navigationBarBackButtonHidden(true)
        .onAppear {
            isAnimating = true
        }
        .fullScreenCover(isPresented: $showVideoModal, content: VideoModalSheetView.init)
    }
    
    func resetState() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            isCorrect = false
        }
    }
}

struct GameSceneView_Previews: PreviewProvider {
    static var previews: some View {
        GameSceneView(stageId: "stage1M1U1", outline: "framePapa")
            .environmentObject(GameViewModel(games: GameData.gamesM1U1S1))
    }
}


struct GameBackround: View {
    @Binding var isAnimating: Bool
    let width: Double
    
    var body: some View {
        Group {
            Image("gameSceneBg")
                .resizable()
                .ignoresSafeArea()
            MovingCloud(size: 100, isAnimating: $isAnimating)
                .offset(x: isAnimating ? -(width/2 - 20) : -(width/2), y: 80)
            MovingCloud(size: 160, isAnimating: $isAnimating)
                .offset(x: isAnimating ? width/2 - 8 : width/2 - 64)
        }
    }
}

struct GameHeader: View {
    @Environment(\.dismiss) private var dismiss
    let currentIndex: Int
    let gameLength: Int
    let babyChat: BabyChat
    let isInfoScene: Bool
    @Binding var showVideoModal: Bool
    
    var body: some View {
        HStack {
            Button(action: {
                dismiss()
            }){
                Image(systemName: "xmark")
                    .foregroundColor(Color(uiColor: .darkGray))
                    .font(.title3.bold())
            }
            ProgressBarView(label: nil, value: currentIndex + 1, maximum: gameLength + 1, scale: 0.8)
                .offset(y: 0)
                .foregroundColor(Color(uiColor: .systemGray6))
                .padding(.leading, 8)
            Text("\(currentIndex + 1) out of \(gameLength)")
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
                    .offset(x: isInfoScene ? 100 : 0)
                    .animation(.easeInOut(duration: 0.8).delay(0.6), value: isInfoScene)
                }
            
        }
        .padding()
        .overlay(alignment: .bottom){
            BabyChatBubbles(data: babyChat)
                .offset(y: 64)
                .offset(x: isInfoScene ? 0 : -1000)
                .animation(.easeInOut(duration: isInfoScene ? 0.8 : 0).delay(isInfoScene ? 0.6 : 0), value: isInfoScene)
        }
    }
}

struct GameContent: View {
    let lottie: String
    let content: String
    let isInfoScene: Bool
    
    var body: some View {
        LottieView(name: lottie, loopMode: .loop, animationSpeed: 0.4)
            .id(content)
            .allowsHitTesting(false)
            .frame(height: isInfoScene ? 200 : 280)
            .animation(.easeInOut(duration: 0.8).delay(0.4), value: isInfoScene)
            .shadow(radius: 1)
            .overlay(alignment: .top){
                ZStack {
                    Image("cloud")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 90)
                        .scaleEffect(x: 1.4, y: 1.2)
                    HStack(alignment: .firstTextBaseline) {
                        Text(content)
                            .font(FontProvider.custom(.sassoon, size: .title)
                                .weight(.bold))
                            .foregroundColor(.red)
                        TextToSpeechView(word: content)
                    }
                }
                .offset(y: -120)
                .offset(x: isInfoScene ? 500 : 0)
                .animation(.easeInOut(duration: 0.8).delay(0.4), value: isInfoScene)
            }
            .offset(y: isInfoScene ? 160 : 80)
    }
}

struct GameFooter: View {
    @EnvironmentObject private var viewModel: GameViewModel
    @Binding var isCorrect : Bool
    @Binding var starState : Int
    let stageId : String
    let content : String
    var body: some View {
        ZStack {
            Button( action: {
                viewModel.nextGame()
                if (viewModel.reachedEnd) {
                    print("naise")
                    CompleteStagesData.append(CompleteStage(id: stageId, starCount: starState))
                }
            }) {
                Text("Lanjut")
                    .font(FontProvider.custom(.sassoon, size: .title3)
                        .weight(.bold))
                    .padding(.vertical, 16)
                    .padding(.horizontal, 48)
            }
            .foregroundColor(.white)
            .fixedSize(horizontal: true, vertical: true)
            .buttonStyle(RaisedButtonStyle())
            .offset(y: viewModel.isInfoScene ? 0 : 200)
            .animation(.easeInOut(duration: 0.5).delay(1), value: viewModel.isInfoScene)
            HStack {
                Button( action: {
                    viewModel.setGameIncomplete()
                }) {
                    Image(systemName: "xmark")
                        .font(.title)
                        .foregroundColor(.white)
                        .padding(12)
                }
                .fixedSize(horizontal: true, vertical: true)
                .buttonStyle(RaisedButtonStyle(color: .red))
                SpeakButtonView(word: content, isCorrect: $isCorrect)
                Button( action: {
                    viewModel.setGameCompleted()
                    if (starState < 3){
                        starState += 1
                    }
                    print("jalan kok \(starState)")
                }) {
                    Image(systemName: "checkmark")
                        .font(.title)
                        .foregroundColor(.white)
                        .padding(12)
                }
                .fixedSize(horizontal: true, vertical: true)
                .buttonStyle(RaisedButtonStyle(color: .darkGreenColor))
            }
            .padding(.bottom, 52)
            .padding(.horizontal, 24)
            .offset(y: viewModel.isInfoScene ? 500 : 0)
            .animation(.easeInOut(duration: 0.8), value: viewModel.isInfoScene)
        }
    }
}
