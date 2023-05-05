//
//  CameraContentView.swift
//  ToddTalks
//
//  Created by Kresna Faza R on 04/05/23.
//

import SwiftUI
import AVFoundation
import Photos

struct CameraContentView: View {
    var body: some View {
        CameraView()
    }
}

struct CameraContentView_Previews: PreviewProvider {
    static var previews: some View {
        CameraContentView()
    }
}


struct CameraView :  View {
    @StateObject var camera = CameraModel()
    @State private var capturedImage: UIImage?
    @Environment(\.managedObjectContext) var managedObjContext
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ZStack {
            if (camera.isTaken)
            {
                VStack {
                    HStack{
                        Spacer()
                        Image(systemName: "gobackward")
                            .resizable()
                            .frame(width: 40,height: 40)
                            .padding(10)
                            .foregroundColor(Color("PrimaryColor"))
                    }
                    Spacer()
                }.onTapGesture {
                    camera.reTake()
                }
            }
            
            VStack {
                Text("poto yu!").font(.custom("Nice Sugar", size: 40))
                    .foregroundColor(Color("PrimaryColor"))
                    .padding(0)
                CameraPreview(camera: camera)
                    .ignoresSafeArea(.all, edges: .all)
            }
            frameView()
            
            
            if let image = capturedImage {
                Image(uiImage: image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            }
            
            VStack {
                Spacer()
                HStack {
                    if camera.isTaken {
                        Button(action: {
                            guard let image = camera.savePic() else {
                                return
                            }
                            saveToCoreData(achievementId: 1, image: image)
                        }, label: {
                            Text("Lanjut")
                                .font(FontProvider.custom(.niceSugar, size: .title))  .buttonStyle(RaisedButtonStyle())
                        })
                        .buttonStyle(RaisedButtonStyle())
                        .frame(width: 200,height: 58)
                        .foregroundColor(.white)
                        .padding()
                        .padding(.top, 16)
                    }
                    else {
                        
                        Button(action: camera.takePic, label: {
                            
                            ZStack {
                                Circle().fill(Color.white)
                                    .frame(width: 70)
                                    .overlay {
                                        VStack {
                                            Image(systemName: "camera")
                                                .resizable()
                                                .aspectRatio(contentMode: .fit)
                                                .padding(10)
                                                .foregroundColor(.gray)
                                            
                                            
                                        }
                                        .foregroundStyle(.white)
                                        .bold()
                                    }
                                
                                Circle().stroke(Color.gray,lineWidth: 5)
                                    .frame(width: 75,height: 75)
                            }
                        })
                    }
                }
            }
        }
        .onAppear(perform: {
            camera.Check()
        })
    }
    
    func saveToCoreData(achievementId : Int16, image : Data) {
        AchievementController().addCompletedAchievement(achievementId: achievementId, imageData: image, context: managedObjContext)
    }
}

class CameraModel: NSObject,ObservableObject, AVCapturePhotoCaptureDelegate {
    @Published var isTaken = false
    @Published var session = AVCaptureSession()
    @Published var alert = false
    @Published var output = AVCapturePhotoOutput()
    @Published var preview : AVCaptureVideoPreviewLayer!
    @Published var pictData = Data(count: 0)
    
    func Check(){
        switch AVCaptureDevice.authorizationStatus(for: .video) {
        case .authorized:
            setUp()
            return
        case .notDetermined:
            AVCaptureDevice.requestAccess(for: .video) { (status) in
                if (status) {
                    self.setUp()
                }
            }
        case .denied:
            self.alert.toggle()
        default:
            return
        }
    }
    func setUp(){
        do{
            self.session.beginConfiguration()
            self.session.sessionPreset = .photo
            let device = AVCaptureDevice.default(.builtInWideAngleCamera, for: .video, position: .front)
            let input = try AVCaptureDeviceInput(device: device!)
            if self.session.canAddInput(input){
                self.session.addInput(input)
            }
            if self.session.canAddOutput(self.output){
                self.session.addOutput(self.output)
            }
            
            self.session.commitConfiguration()
        }
        catch{
            print(error.localizedDescription)
        }
    }
    
    func takePic() {
        DispatchQueue.global(qos: .background).async {
            self.output.capturePhoto(with: AVCapturePhotoSettings(), delegate: self)
            
            DispatchQueue.main.async { Timer.scheduledTimer(withTimeInterval: 0.1, repeats: false) { (timer) in self.session.stopRunning() } }
            
            DispatchQueue.main.async {
                withAnimation{self.isTaken.toggle()}
            }
            print("Take pic")
        }
    }
    
    func reTake(){
        DispatchQueue.global(qos: .background).async {
            self.session.startRunning()
            
            DispatchQueue.main.async {
                withAnimation{self.isTaken.toggle()}
            }
        }
    }
    
    func photoOutput(
        _ output: AVCapturePhotoOutput,
        didFinishProcessingPhoto photo: AVCapturePhoto,
        error: Error?
    ) {
        if error != nil {
            print("something happen")
            return
        }
        guard let imageData = photo.fileDataRepresentation() else{return}
        self.pictData = imageData
        
    }
    
    func savePic() -> Data?{
        let image = UIImage(data: self.pictData)!
        let overlay = UIImage(named: "frameAwan")
        let widthRect = image.size.width
        let heightRect = image.size.height
        let overlayRect = CGRect(x: 0, y: 0, width: widthRect, height: heightRect)
        guard let overlay = overlay else {
            return nil
        }
        let newImage = addOverlayToImage(image: image, overlayImage: overlay, overlayRect: overlayRect)
        
        guard let newImage = newImage else {
            return nil
        }
        UIImageWriteToSavedPhotosAlbum(newImage,nil,nil,nil)
        
        guard let jpegData = newImage.jpegData(compressionQuality: 1.0) else {
            return nil
        }
        
        return jpegData
        
        
    }
}

func addOverlayToImage(image: UIImage, overlayImage: UIImage, overlayRect: CGRect) -> UIImage? {
    let size = image.size
    let newSize = CGSize(width: image.size.width - 400, height: image.size.height - 400)
    let scale = 0.9
    // Buat sebuah konteks gambar dengan ukuran yang sama dengan gambar asli.
    UIGraphicsBeginImageContextWithOptions(size, false, scale)
    
    // Gambar gambar asli pada konteks gambar.
    image.draw(in: CGRect(origin: .init(x: 220, y: 220) , size: newSize))
    
    // Gambar overlay pada konteks gambar.
    overlayImage.draw(in: overlayRect)
    
    // Ambil gambar yang dihasilkan dari konteks gambar.
    let newImage = UIGraphicsGetImageFromCurrentImageContext()
    
    // Hentikan konteks gambar.
    UIGraphicsEndImageContext()
    
    // Kembalikan gambar yang telah dihasilkan.
    return newImage
}



struct frameView: View {
    var body: some View {
        Image("frameAwan")
            .resizable()
            .frame(width: 370,height: 642)
            .offset(x: -1,y: -20)
    }
}

extension View {
    func snapshot() -> UIImage {
        let controller = UIHostingController(rootView: self)
        let view = controller.view
        
        let format = UIGraphicsImageRendererFormat()
        format.scale = 1
        format.opaque = true
        
        let targetSize = controller.view.intrinsicContentSize
        view?.bounds = CGRect(origin: .zero, size: targetSize)
        view?.backgroundColor = .clear
        
        let window = UIWindow(frame: view!.bounds)
        window.addSubview(controller.view)
        window.makeKeyAndVisible()
        
        let renderer = UIGraphicsImageRenderer(bounds: view!.bounds, format: format)
        return renderer.image { rendererContext in
            view?.layer.render(in: rendererContext.cgContext)
        }
    }
}

struct CameraPreview: UIViewRepresentable {
    @ObservedObject var camera: CameraModel
    
    func makeUIView(context: Context) -> UIView {
        let view = UIView(frame: CGRect(x: 36, y: 0, width: 320, height: 552))
        
        camera.preview = AVCaptureVideoPreviewLayer(session: camera.session)
        camera.preview.frame = view.frame
        
        camera.preview.videoGravity = .resizeAspectFill
        view.layer.addSublayer(camera.preview)
        
        camera.session.startRunning()
        return view
    }
    
    func updateUIView(_ uiView: UIView, context: Context) {
        
    }
}
