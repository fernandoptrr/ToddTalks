//
//  ProfilePicture.swift
//  ToddTalks
//
//  Created by Angelica Pinonkuan on 06/05/23.
//

import SwiftUI

struct ProfilePicture: View {
    
    @State var changeProfileImage = false
    @State var openCameraRoll = false
    @State var imageSelected = UIImage()
    
    var body: some View {
        
        ZStack(alignment: .bottomTrailing) {
            Button {
                changeProfileImage = true
                openCameraRoll = true
                        
            } label: {
                if changeProfileImage {
                    Image(uiImage: imageSelected)
                        .resizable()
                        .clipShape(Circle())
                        .frame(width: 200)
                } else {
                    ZStack{
                        Circle()
                            .frame(width: 200)
                            .foregroundColor(.gray)
                        Image(systemName: "camera")
                            .font(.system(size: 60))
                            .foregroundColor(.white)
                    }
                }
            }
                   
        }.sheet(isPresented: $openCameraRoll) {
            ImagePicker(selectedImage: $imageSelected, sourceType: .camera)
        }
        
        
    }
}

struct ProfilePicture_Previews: PreviewProvider {
    static var previews: some View {
        ProfilePicture()
    }
}
