//
//  CameraContentView.swift
//  ToddTalks
//
//  Created by Kresna Faza R on 04/05/23.
//

import SwiftUI
import AVFoundation

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
    var body: some View {
        ZStack {
            VStack {
                Text("poto yu!").font(.custom("Nice Sugar", size: 40))
                    .foregroundColor(Color("PrimaryColor"))
                    .padding(0)
                CameraPreview(camera: camera)
                    .ignoresSafeArea(.all, edges: .all)
            }
            Image("frameAwan")
                .resizable()
                .frame(width: 370,height: 642)
                .offset(x: -1,y: -20)
            VStack {
                Spacer()
                HStack {
                    if camera.isTaken {
                        Button(action: {}, label: {
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
                        
                        Button(action: {camera.takePic()}, label: {
                            
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
}

class CameraModel: NSObject,ObservableObject, AVCapturePhotoCaptureDelegate {
    @Published var isTaken = false
    @Published var session = AVCaptureSession()
    @Published var alert = false
    @Published var output = AVCapturePhotoOutput()
    @Published var preview : AVCaptureVideoPreviewLayer!
    
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
            self.session.stopRunning()
            
            DispatchQueue.main.async {
                withAnimation{self.isTaken.toggle()}
            }
        }
    }
    
    func photoOutput(_ output: AVCapturePhotoOutput, didFinishProcessingPhoto photo: AVCapturePhoto, error: Error?) {
        if error != nil {
            return
        }
        print("Picture taken... ")
        
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
