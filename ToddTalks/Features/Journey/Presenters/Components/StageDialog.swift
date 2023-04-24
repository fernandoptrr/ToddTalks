import SwiftUI

struct StageDialog: View {
    @Binding var isPresented: Bool
    let title: String
    let message: String
    let hintContent: [String]?
    let primaryButtonTitle: String
    let primaryButtonAction: () -> Void
    let secondaryButtonTitle: String?
    let secondaryButtonAction: (() -> Void)?
    let starCount: Int
    
    @State private var offset: CGFloat = 1000
    
    var body: some View {
        ZStack {
            Color.black
                .opacity(0.7)
                .onTapGesture {
                    close()
                }
            ZStack {
                RoundedRectangle(cornerRadius: 24, style: .continuous)
                    .fill(Color.white.opacity(0.6))
                    .offset(y: 4)
                VStack {
                    Text(title) .font(FontProvider.custom(.niceSugar, size: .title))
                        .padding(.top, 32)
                        .padding(.bottom, 8)
                    Text(message) .font(FontProvider.custom(.niceSugar, size: .caption2))
                        .multilineTextAlignment(.center)
                        .padding(.bottom, 16)
                        .padding(.horizontal)
                    if hintContent != nil {
                        HintCarousel(carouselContent: hintContent!)
                            .frame(height: 90)
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
                        Image(systemName: "star.fill")
                            .foregroundColor(.yellow)
                            .font(.system(size: 48))
                            .rotationEffect(.degrees(58))
                            .shimmering()
                            .offset(x: 6)
                        Image(systemName: "star.fill")
                            .foregroundColor(.yellow)
                            .font(.system(size: 56))
                            .shimmering()
                            .offset(y: -14)
                        Image(systemName: "star")
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
            title: "Learn P, M, L",
            message: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
            hintContent: nil,
            primaryButtonTitle: "Play Now",
            primaryButtonAction: {},
            secondaryButtonTitle: nil,
            secondaryButtonAction: nil,
            starCount: 3
        )
    }
}
