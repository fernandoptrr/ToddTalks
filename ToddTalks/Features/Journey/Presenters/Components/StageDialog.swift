import SwiftUI

struct StageDialog: View {
    @Binding var isPresented: Bool
    let stage: Stage
    @State private var offset: CGFloat = 1000
    @StateObject private var gameViewModel: GameViewModel
    @State private var isStarted = false
    @State var currStar = 0
    @Environment(\.managedObjectContext) var managedObjContext
    
    init(isPresented: Binding<Bool>, stage: Stage) {
        self._isPresented = isPresented
        self.stage = stage
        self._gameViewModel = StateObject(wrappedValue: GameViewModel(games: stage.games))
    }
    
    private func getStarColor(value: Int) -> Color {
        return stage.starCount >= value ? Color.yellow : Color(uiColor: .systemGray4)
    }
    
    var body: some View {
        ZStack {
            NavigationLink(destination: GameSceneView(stageId: stage.id,outline: stage.outline).environmentObject(gameViewModel).environment(\.managedObjectContext, managedObjContext), isActive: $isStarted) {
                EmptyView()
            }
            Color.black
                .opacity(0.6)
                .onTapGesture {
                    close()
                }
            ZStack {
                RoundedRectangle(cornerRadius: 24, style: .continuous)
                    .fill(Color(uiColor: .systemGray4))
                    .offset(y: 6)
                VStack {
                    Text(stage.title)
                        .font(FontProvider.custom(.niceSugar, size: .title))
                        .foregroundColor(.primaryColor)
                        .padding(.top, 32)
                        HintText(text: stage.body)
                            .padding(.top, 16)
                    Button("Mulai") {
                        close()
                        isStarted = true
                    }
                    .buttonStyle(RaisedButtonStyle())
                    .foregroundColor(.white)
                    .frame(height: 44)
                    .padding(.top, 16)
                    .padding()
                }
                .padding()
                .background(.white)
                .clipShape(RoundedRectangle(cornerRadius: 24))
                .overlay(alignment: .topTrailing) {
                    Button {
                        close()
                    } label: {
                        Image(systemName: "xmark")
                            .font(.title3)
                    }
                    .tint(.black)
                    .padding()
                }
                .overlay(alignment: .top){
                    HStack {
                        if currStar >= 1 {
                            Image(systemName: "star.fill")
                                .foregroundColor(getStarColor(value: 1))
                                .font(.system(size: 48))
                                .rotationEffect(.degrees(58))
                                .shimmering()
                                .offset(y: 6)
                        } else {
                            Image(systemName: "star.fill")
                                .foregroundColor(getStarColor(value: 1))
                                .font(.system(size: 48))
                                .rotationEffect(.degrees(58))
                                .offset(y: 6)
                        }
                        if currStar >= 2 {
                            Image(systemName: "star.fill")
                                .foregroundColor(getStarColor(value: 2))
                                .font(.system(size: 56))
                                .shimmering()
                                .offset(y: -14)
                        } else {
                            Image(systemName: "star.fill")
                                .foregroundColor(getStarColor(value: 2))
                                .font(.system(size: 56))
                                .offset(y: -14)
                        }
                        if currStar >= 3 {
                            Image(systemName: "star.fill")
                                .foregroundColor(getStarColor(value: 3))
                                .font(.system(size: 48))
                                .rotationEffect(.degrees(-58))
                                .shimmering()
                                .offset(x: -6)
                        } else {
                            Image(systemName: "star.fill")
                                .foregroundColor(getStarColor(value: 3))
                                .font(.system(size: 48))
                                .rotationEffect(.degrees(-58))
                                .offset(x: -6)
                        }
                    }
                    .offset(y: -28)
                }
                .onAppear {
                    withAnimation(.spring()) {
                        offset = 0
                    }
                    countStar()
                }
            }
            .padding(.horizontal, 32)
            .offset(x: 0, y: offset)
            .fixedSize(horizontal: false, vertical: true)
        }
        .ignoresSafeArea()
        .navigationBarBackButtonHidden()
    }
    
    func close() {
        withAnimation(.spring()) {
            offset = 1000
            isPresented.toggle()
        }
    }
    
    func countStar(){
        CompleteStagesData.forEach{
            item in
            if (item.id == stage.id){
                currStar = item.starCount
            }
        }
    }
}

struct DialogView_Previews: PreviewProvider {
    static var previews: some View {
        StageDialog(
            isPresented: .constant(true),
            stage:StageData.stage1M1U1
        )
        .environmentObject(GameViewModel(games: GameData.gamesM1U1S1))
    }
}
