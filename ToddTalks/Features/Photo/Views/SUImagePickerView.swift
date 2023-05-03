//
//  SUImagePickerView.swift
//  ToddTalks
//
//  Created by Kresna Faza R on 03/05/23.
//

import SwiftUI
import UIKit

struct SUImagePickerView: UIViewControllerRepresentable {
    
    var sourceType: UIImagePickerController.SourceType = .photoLibrary
    @Binding var image: Image?
    @Binding var isPresented: Bool
    
    func makeCoordinator() -> ImagePickerViewCoordinator {
        return ImagePickerViewCoordinator(image: $image, isPresented: $isPresented)
    }
    
    func makeUIViewController(context: Context) -> UIImagePickerController {
        let pickerController = UIImagePickerController()
        pickerController.sourceType = sourceType
        pickerController.delegate = context.coordinator
        if (sourceType == UIImagePickerController.SourceType.camera) {
            pickerController.sourceType = .camera
            pickerController.allowsEditing = true
            pickerController.delegate = context.coordinator
            
            let screenSize: CGRect = UIScreen.main.bounds
            let screenWidth = screenSize.width
            let screenHeight = screenSize.height
            
            let screenRect = UIScreen.main.bounds
            let view = UIView(frame: CGRect(x: 0, y: 93, width: screenWidth, height: screenHeight - 80 - 240))
            view.backgroundColor = UIColor.black.withAlphaComponent(0.8)
            
            view.backgroundColor = UIColor.red.withAlphaComponent(0.2)
            
            
            let holeRect = CGRect(x: screenRect.midX - 100, y: screenRect.midY - 220, width: 200, height: 200)
            let maskLayer = CAShapeLayer()
            let path = UIBezierPath(roundedRect: screenRect, cornerRadius: 0)
            let holePath = UIBezierPath(roundedRect: holeRect, cornerRadius: 100)
            path.append(holePath)
            path.usesEvenOddFillRule = true
            maskLayer.path = path.cgPath
            maskLayer.fillRule = .evenOdd
            
            view.layer.mask = maskLayer
            
            pickerController.cameraOverlayView = view
            
            
            return pickerController
        }
        return pickerController
    }
    
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {
        // Nothing to update here
    }
    
}

class ImagePickerViewCoordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    @Binding var image: Image?
    @Binding var isPresented: Bool
    
    init(image: Binding<Image?>, isPresented: Binding<Bool>) {
        self._image = image
        self._isPresented = isPresented
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            self.image = Image(uiImage: image)
        }
        self.isPresented = false
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        self.isPresented = false
    }
    
}
