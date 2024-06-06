//
//  CameraViewController.swift
//  Math-AI
//
//  Created by Fatih on 6.06.2024.
//

import Foundation
import UIKit
import AVFoundation

class CameraViewController: UIViewController {
    
    //MARK: - Properties
    var cameraView = CameraView()
    // Capture Session
    var session: AVCaptureSession?
    // Photo Output
    let output = AVCapturePhotoOutput()
    
    
    //MARK: - Life Cycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        checkCameraPermissions()
        addTargets() 
    }
    
    override func loadView() {
        super.loadView()
        view = cameraView
    }
    
    private func checkCameraPermissions() {
        switch AVCaptureDevice.authorizationStatus(for: .video) {
            
        case .notDetermined:
            // Request
            AVCaptureDevice.requestAccess(for: .video) { [weak self] granted in
                guard granted else { return }
                DispatchQueue.main.async {
                    self?.setupCamera()
                }
            }
        case .restricted:
            break
        case .denied:
            break
        case .authorized:
            setupCamera()
        @unknown default:
            break
        }
    }
    
    private func setupCamera() {
         let session = AVCaptureSession()
        if let device = AVCaptureDevice.default(for: .video) {
            do {
                
                let input = try AVCaptureDeviceInput(device: device)
                if session.canAddInput(input) {
                    session.addInput(input)
                }
                
                if session.canAddOutput(output) {
                    session.addOutput(output)
                }
                
                cameraView.previewLayer.videoGravity = .resizeAspectFill
                cameraView.previewLayer.session = session
                session.startRunning()
                self.session = session
                
            } catch {
                print(error)
            }
        }
    }
    
    func addTargets() {
        cameraView.shutterButton.addTarget(self, action: #selector(didTapTakePhoto), for: .touchUpInside)
    }
    
    @objc func didTapTakePhoto() {
        output.capturePhoto(with: AVCapturePhotoSettings(), delegate: self)
    }
}

//MARK: - AVCapturePhotoCaptureDelegate
extension CameraViewController: AVCapturePhotoCaptureDelegate {
    func photoOutput(_ output: AVCapturePhotoOutput, didFinishProcessingPhoto photo: AVCapturePhoto, error: Error?) {
        guard let data = photo.fileDataRepresentation() else { return }
        let image = UIImage(data: data)
        session?.stopRunning()
        let imgeView = UIImageView(image: image)
        imgeView.contentMode = .scaleAspectFill
        imgeView.frame = cameraView.bounds
        cameraView.addSubview(imgeView)
    }
}
