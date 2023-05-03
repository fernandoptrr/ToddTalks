//
//  ImagePickerView.swift
//  ToddTalks
//
//  Created by Angelica Pinonkuan on 02/05/23.
//

import SwiftUI

struct ImagePickerView: View {
    @State private var isShowingImagePicker = false
    @State private var selectedImage: Image?

    var body: some View {
        VStack {
            
            ZStack{
                VStack{
                    
                    if let image = selectedImage {
                        image
                            .resizable()
                            .scaledToFit()
                            .padding()
                        
                    } else {
                        Text("No image selected")
                            .font(.system(size: 20))
                        Button {
                            isShowingImagePicker = true
                        } label: {
                            Text("Select Image")
                                .font(.system(size: 30))
                        }
                        .sheet(isPresented: $isShowingImagePicker) {
                            ImagePicker(selectedImage: $selectedImage)
                        }
                        
                    }
                }
            }
            .padding(.horizontal, 30)
            .padding(.bottom, 10)
            
        }
        .padding()
    }
        
}

struct ImagePickerView_Previews: PreviewProvider {
    static var previews: some View {
        ImagePickerView()
    }
}

struct ImagePicker: View {
    @Binding var selectedImage: Image?

    var body: some View {
        ImagePickerWrapper(selectedImage: $selectedImage)
    }
}

struct ImagePickerWrapper: UIViewControllerRepresentable {
    @Binding var selectedImage: Image?

    class Coordinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
        @Binding var selectedImage: Image?
        @Environment(\.presentationMode) var presentationMode

        init(selectedImage: Binding<Image?>) {
            _selectedImage = selectedImage
        }

        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
            if let uiImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
                selectedImage = Image(uiImage: uiImage)
            }

            presentationMode.wrappedValue.dismiss()
        }

        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            presentationMode.wrappedValue.dismiss()
        }
    }

    func makeCoordinator() -> Coordinator {
        Coordinator(selectedImage: $selectedImage)
    }

    func makeUIViewController(context: UIViewControllerRepresentableContext<ImagePickerWrapper>) -> UIImagePickerController {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = context.coordinator
        return imagePicker
    }

    func updateUIViewController(_ uiViewController: UIImagePickerController, context: UIViewControllerRepresentableContext<ImagePickerWrapper>) {}
}



