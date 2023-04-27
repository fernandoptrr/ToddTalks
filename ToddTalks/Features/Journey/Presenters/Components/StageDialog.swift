import SwiftUI

struct StageDialog: View {
    @Binding var isPresented: Bool
    let headline: String
    let subHeadline: String
    let tips: [String]?
    let primaryButtonTitle: String
    let primaryButtonAction: () -> Void
    let secondaryButtonTitle: String?
    let secondaryButtonAction: (() -> Void)?
    let starCount: Int
    
    @State private var offset: CGFloat = 1000
    
    private func getStarIc(value: Int) -> String {
        return starCount >= value ? "star.fill" : "star"
    }
    
    var body: some View {
        ZStack {
            Color.black
                .opacity(0.64)
                .onTapGesture {
                    close()
                }
            ZStack {
                RoundedRectangle(cornerRadius: 24, style: .continuous)
                    .fill(Color(uiColor: .systemGray4))
                    .offset(y: 6)
                VStack {
                    Text(headline) .font(FontProvider.custom(.niceSugar, size: .title))
                        .padding(.top, 32)
                    Text(subHeadline)
                        .font(FontProvider.custom(.niceSugar, size: .subheadline))
                        .multilineTextAlignment(.center)
                        .padding(.top, 4)
                    if tips != nil {
                        HintText(text: """
                        • You're a loyal and caring friend!
                        • You're empathetic and have a strong sense of fairness and justice.
                        • You're a natural mediator and prefer to avoid conflict, preferring instead to foster harmony and cooperation among those around you.
                        """)
                        .padding(.top, 16)
                    }
                    HStack {
                        Button(primaryButtonTitle) {
                            primaryButtonAction()
                            isPresented = false
                        }
                        if let secondaryButtonTitle = secondaryButtonTitle,
                           let secondaryButtonAction = secondaryButtonAction {
                            Button(secondaryButtonTitle) {
                                secondaryButtonAction()
                                close()
                            }
                            .padding(.leading, 8)
                        }
                        
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
            headline: "Gesture 101",
            subHeadline: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor.",
            tips: ["sss", "ss"],
            primaryButtonTitle: "Start",
            primaryButtonAction: {},
            secondaryButtonTitle: nil,
            secondaryButtonAction: nil,
            starCount: 3
        )
    }
}
