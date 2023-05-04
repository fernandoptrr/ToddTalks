import SwiftUI

struct StageDialog: View {
    @Binding var isPresented: Bool
    let stage: Stage
    var primaryButtonTitle: String = "Mulai"
//    let primaryButtonAction: () -> Void
//    let secondaryButtonTitle: String?
//    let secondaryButtonAction: (() -> Void)?
    
    @State private var offset: CGFloat = 1000

    
    private func getStarIc(value: Int) -> String {
        return stage.starCount >= value ? "star.fill" : "star"
    }
    
    var body: some View {
        ZStack {
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
                    Text(stage.body)
                        .font(FontProvider.custom(.sassoon, size: .body))
                        .multilineTextAlignment(.center)
                        .padding(.top, 4)
                    if stage.tips != nil {
                        HintText(text: stage.tips!)
                        .padding(.top, 16)
                    }
//                    HStack {
                    NavigationLink(destination: GameSceneView()){
                        Button(primaryButtonTitle) {
//                            primaryButtonAction()
                            isPresented = false
                        }
                    }
                        
//                        if let secondaryButtonTitle = secondaryButtonTitle,
//                           let secondaryButtonAction = secondaryButtonAction {
//                            Button(secondaryButtonTitle) {
//                                secondaryButtonAction()
//                                close()
//                            }
//                            .padding(.leading, 8)
//                        }
                        
//                    }
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
                        Image(systemName: getStarIc(value: 1))
                            .foregroundColor(.yellow)
                            .font(.system(size: 48))
                            .rotationEffect(.degrees(58))
                            .shimmering()
                            .offset(x: 6)
                        Image(systemName: getStarIc(value: 2))
                            .foregroundColor(.yellow)
                            .font(.system(size: 56))
                            .shimmering()
                            .offset(y: -14)
                        Image(systemName: getStarIc(value: 3))
                            .foregroundColor(.yellow)
                            .font(.system(size: 48))
                            .rotationEffect(.degrees(-58))
                            .shimmering()
                            .offset(x: -6)
                    }
                    .offset(y: -28)
                    .shadow(color: .yellow ,radius: 4)
                    
                }
                .onAppear {
                    withAnimation(.spring()) {
                        offset = 0
                    }
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
            isPresented = false
        }
    }
}

struct DialogView_Previews: PreviewProvider {
    static var previews: some View {
        StageDialog(
            isPresented: .constant(true),
            stage:             Stage(illPath: "play.fill", title: "Gesture 1", body: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor.", tips: "haha", starCount: 3)
//            ,
//            primaryButtonAction: {},
//            secondaryButtonTitle: nil,
//            secondaryButtonAction: nil
        )
    }
}
