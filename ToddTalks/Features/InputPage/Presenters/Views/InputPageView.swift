//
//  InputPageView.swift
//  ToddTalks
//
//  Created by Angelica Pinonkuan on 02/05/23.
//

import SwiftUI

struct InputPageView: View {
    
    @State private var namaAnak: String = ""
    @State private var usia: String = ""
    @State private var usiaButtonTitle = "12 - 24 bulan"
    
    
    @State private var selectedOption = "Option 1"
    let options = ["12 - 24 bulan", "24 - 36 bulan ", "36 - 42 bulan"]
    
    var body: some View {
        
        NavigationStack {
            ZStack {
                Color.primaryBgColor
                    .ignoresSafeArea()
                
                VStack{
                    
                    Text("KataKecil")
                        .font(FontProvider.custom(.niceSugar, size: .largeTitle))
                        .foregroundColor(.textColor)
                        .padding(.top,24)
                    
                    NavigationLink{
                        ImagePickerView()
                    } label: {
                        InputProfilePic()
                    }
                    
                    VStack (alignment: .leading){
                        Text("Nama Anak")
                            .font(FontProvider.custom(.niceSugar, size: .title))
                            .foregroundColor(.textColor)
                            .padding(.top,24)
                            .padding(.bottom, -5)
                            .padding(.leading, 10)
                        
                        TextField("masukkan nama anak", text: $namaAnak)
                            .font(.system(size: 15))
                            .foregroundColor(.textColor)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.white)
                            .cornerRadius(43)
                            .shadow(color: Color.black.opacity(0.08), radius: 60)
                        
                        
                        Text("Usia")
                            .font(FontProvider.custom(.niceSugar, size: .title))
                            .foregroundColor(.textColor)
                            .padding(.top,24)
                            .padding(.bottom, -5)
                            .padding(.leading, 10)
                        
                        Menu {
                            Button("12-24 bulan", action: {firstYear()})
                            Button("24-36 bulan", action: {secondYear()})
                            Button("36-42 bulan", action: {thirdYear()})
                        } label: {
                            HStack{
                                Text("\(usiaButtonTitle)")
                                Spacer()
                                VStack{
                                    Image(systemName: "arrowtriangle.up.fill")
                                    Spacer()
                                    Image(systemName: "arrowtriangle.down.fill")
                                }
                                .font(.system(size: 10))
                            }
                        }
                        .font(.system(size: 15))
                        .foregroundColor(.textColor)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .frame(maxHeight: 55)
                        .background(Color.white)
                        .cornerRadius(43)
                        .shadow(color: Color.black.opacity(0.08), radius: 60)

                        Spacer()
                                        
                        NavigationLink(destination: MilestoneView()) {
                            Text("Masuk")
                                .font(FontProvider.custom(.sassoon, size: .title3).weight(.bold))
                        }
                        .buttonStyle(RaisedButtonStyle(color: .textColor))
                        .frame(height: 58)
                        .foregroundColor(.white)
                        .padding()
                        .padding(.top, 16)
                        
                    }
                    .padding(.vertical, 30)
                    
                    
                }
                .padding(.horizontal, 30)
            }
        }
    }
    
    func firstYear (){
        self.usiaButtonTitle = "12 - 24 bulan"
    }
    func secondYear (){
        self.usiaButtonTitle = "24 - 36 bulan"
    }
    func thirdYear (){
        self.usiaButtonTitle = "36 - 42 bulan"
    }
}


struct InputPageView_Previews: PreviewProvider {
    static var previews: some View {
        InputPageView()
    }
}
