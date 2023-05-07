//
//  ProfilePicture.swift
//  ToddTalks
//
//  Created by Angelica Pinonkuan on 06/05/23.
//

import SwiftUI

struct ProfilePicture: View {
    
    @State private var showSheet: Bool = false
    @State private var showImagePicker: Bool = false
    @State private var sourceType: UIImagePickerController.SourceType = .camera
    @State private var image: UIImage?
    
    var body: some View {
        
            VStack {
                Button {
                    self.showSheet = true
                } label: {
                    Image(uiImage: image ?? UIImage(named:"profilepic")!)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 200, height: 200)
                        .foregroundColor(.gray)
                        .clipShape(Circle())
                    
                    
                }
                .padding()
                    .actionSheet(isPresented: $showSheet) {
                        ActionSheet(title: Text("Pilih Foto"), buttons: [
                            .default(Text("Pilih Dari Galeri")) {
                                self.showImagePicker = true
                                self.sourceType = .photoLibrary
                            },
                            .default(Text("Ambil Gambar")) {
                                self.showImagePicker = true
                                self.sourceType = .camera
                            },
                            .cancel(Text("Batalkan"))
                        ])
                }
              
            
        }.sheet(isPresented: $showImagePicker) {
            ImagePicker(image: self.$image, isShown: self.$showImagePicker, sourceType: self.sourceType)
        }
    }
}

struct ProfilePicture_Previews: PreviewProvider {
    static var previews: some View {
        ProfilePicture()
    }
}
