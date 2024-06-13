//
//  CameraViewController.swift
//  Math-AI
//
//  Created by Fatih on 6.06.2024.
//

import Foundation
import UIKit
import AVFoundation
import CropViewController

class CameraViewController: UIViewController {
    
    //MARK: - Properties
    var cameraView = CameraView()
    var cameraViewModel = CameraViewModel()
    // Capture Session
    var session: AVCaptureSession?
    // Photo Output
    let output = AVCapturePhotoOutput()
    var selectedImage: UIImage?
    var isFlashLightOn = false
    
    
    //MARK: - Life Cycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        checkCameraPermissions()
        addTargets() 
        setupDelegate()
        firstBootSelection()
//        let model = "gpt-3.5-turbo"
//        let message = [
//            Message(role: .assistant, content: "Merhaba, nasılsın")
//        ]
//        
//        NetworkService.shared.sendChatRequest(model: model, messages: message) { (response: Result< ChatResponseModel, Error>) in
//            switch response {
//            case .success(let success):
//                print("İSTEK BAŞARILI \(success)")
//            case .failure(let failure):
//                print("İSTEK BAŞARISIZ \(failure)")
//            }
//        }
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
        cameraView.galleryButton.addTarget(self, action: #selector(didTapGalleryButton), for: .touchUpInside)
        cameraView.flashButton.addTarget(self, action: #selector(didTapFlashButton), for: .touchUpInside)
        cameraView.translateButton.addTarget(self, action: #selector(didTapTranslateButton), for: .touchUpInside)
        cameraView.retakeButton.addTarget(self, action: #selector(didTapRetakeButton), for: .touchUpInside)
    }
    
    func firstBootSelection() {
        let defaultRow = cameraViewModel.scanOptions.firstIndex { $0.options == "Matematik" } ?? 0
            cameraView.pickerView.selectRow(defaultRow, inComponent: 0, animated: false)
            performActionsBasedOnSelected(selectedOption: cameraViewModel.scanOptions[defaultRow])
        self.pickerView(cameraView.pickerView, didSelectRow: defaultRow, inComponent: 0)
    }
    
    @objc func didTapTranslateButton() {
        let vc = LanguagesViewController()
        vc.delegate = self
        if let sheet = vc.sheetPresentationController {
            sheet.detents = [.medium(), .large()]
            sheet.prefersGrabberVisible = false
            sheet.prefersScrollingExpandsWhenScrolledToEdge = false
            sheet.largestUndimmedDetentIdentifier = .medium
        }
        
        present(vc, animated: true)
    }
    
    @objc func didTapTakePhoto() {
        output.capturePhoto(with: AVCapturePhotoSettings(), delegate: self)

    }
    
    @objc func didTapGalleryButton() {
        let vc = UIImagePickerController()
        vc.sourceType = .photoLibrary
        vc.delegate = self
        vc.allowsEditing = true
        present(vc, animated: true)
        
    }
    
    @objc func didTapRetakeButton() {
        let vc = TabbarController()
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)
    }
    
    @objc func didTapFlashButton() {
        guard let device = AVCaptureDevice.default(for: AVMediaType.video) else {
            print("Flashlight not available on this device")
            return }
        
        if device.hasFlash {
            do {
                try device.lockForConfiguration()
                if isFlashLightOn {
                    device.torchMode = .off
                    isFlashLightOn = false
                    cameraView.flashButton.setImage(.lightning, for: .normal)
                    cameraView.flashButton.tintColor = .white
                } else {
                    do {
                        try device.setTorchModeOn(level: 1.0)
                        isFlashLightOn = true
                        cameraView.flashButton.setImage(.lightningFill, for: .normal)
                        cameraView.flashButton.tintColor = .main
                    } catch {
                        print("Error setting torch level")
                    }
                }
                device.unlockForConfiguration()
            } catch {
                print("Error locking configuration")
            }
        } else {
            print("Torch not available on this device")
        }
    }
}

//MARK: - AVCapturePhotoCaptureDelegate
extension CameraViewController:  UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[.editedImage] as? UIImage {
            selectedImage = image
            let scanningVC = ScanningViewController()
            scanningVC.image = image
            scanningVC.vcTitle = cameraViewModel.scanOptionTitle
            let navController = UINavigationController(rootViewController: scanningVC)
            picker.dismiss(animated: true) {
                navController.modalPresentationStyle = .fullScreen
                self.present(navController, animated: true, completion: nil)
            }
        }
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
}
//MARK: - AVCapturePhotoCaptureDelegate
extension CameraViewController: AVCapturePhotoCaptureDelegate {
    func photoOutput(_ output: AVCapturePhotoOutput, didFinishProcessingPhoto photo: AVCapturePhoto, error: Error?) {
        guard let data = photo.fileDataRepresentation() else { return }
        let image = UIImage(data: data)
        session?.stopRunning()
        DispatchQueue.main.async { [weak self] in
            guard let self else { return }
            showCrop(image: image ?? .cameraGeneral)
            let imgeView = UIImageView(image: image)
            imgeView.contentMode = .scaleAspectFill
            imgeView.frame = cameraView.bounds
            cameraView.addSubview(imgeView)
            tabBarController?.tabBar.isHidden = true
            
        }
        
    }
    
    func showCrop(image: UIImage) {
        let vc = CropViewController(croppingStyle: .default, image: image)
        vc.aspectRatioPreset = .presetSquare
        vc.aspectRatioLockEnabled = true
        vc.toolbarPosition = .bottom
        vc.doneButtonTitle = "Devam"
        vc.cancelButtonTitle = "İptal"
        vc.delegate = self
        present(vc, animated: true) { [weak self] in
            self?.cameraView.retakeButton.isHidden = false
            self?.cameraView.scanButton.isHidden = false
            self?.cameraView.croppedImageView.isHidden = false
            
        }
    }
}

//MARK: - CropViewControllerDelegate
extension CameraViewController: CropViewControllerDelegate {
    func cropViewController(_ cropViewController: CropViewController, didFinishCancelled cancelled: Bool) {
        cropViewController.dismiss(animated: true)
    }
    
    func cropViewController(_ cropViewController: CropViewController, didCropToImage image: UIImage, withRect cropRect: CGRect, angle: Int) {
        cropViewController.dismiss(animated: true)
        cameraView.croppedImageView.image = image
        view.bringSubviewToFront(cameraView.croppedImageView)
        print("Crop Yapıldı")
    }
}

//MARK: - PickerView Configure
extension CameraViewController: UIPickerViewDataSource, UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return cameraViewModel.scanOptions.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return cameraViewModel.scanOptions[row].options
    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 100
    }
    
    func pickerView(_ pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat {
        return 100
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        let view = UIView()
        view.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        
        let label = UILabel()
        label.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 18)
        label.textColor = .white
        label.text = cameraViewModel.scanOptions[row].options
        view.addSubview(label)
        view.transform = CGAffineTransform(rotationAngle: 90 * CGFloat.pi / 180)
        return view
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let selectedRow = cameraViewModel.scanOptions[row]
        performActionsBasedOnSelected(selectedOption: selectedRow)
        cameraViewModel.scanOptionTitle = selectedRow.options
        print(selectedRow)

    }
    
    

    
    func performActionsBasedOnSelected(selectedOption: ScanOptions) {
        switch selectedOption.options {
        case "Çevir":
            cameraView.shutterImageView.image = .cameraTranslate
            cameraView.translateView.isHidden = false
        case "Matematik":
            cameraView.shutterImageView.image = .cameraMath
            cameraView.translateView.isHidden = true
        case "Genel":
            cameraView.shutterImageView.image = .cameraGeneral
            cameraView.translateView.isHidden = true
        default:
            break
        }
    }
    
    func setupDelegate() {
        cameraView.pickerView.delegate = self
        cameraView.pickerView.dataSource = self
    }
    
}

//MARK: - LanguagesViewControllerProtocol
extension CameraViewController: LanguagesViewControllerProtocol {
    func didSelectLanguage(language: String) {
        cameraView.translateButton.setTitle(language, for: .normal)
    }
 
}
