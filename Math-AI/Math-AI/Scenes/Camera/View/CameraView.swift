//
//  CameraView.swift
//  Math-AI
//
//  Created by Fatih on 6.06.2024.
//

import Foundation
import UIKit
import AVFoundation

class CameraView:UIView {
    
    //MARK: - Properties
    
    // Video Preview
    let previewLayer = AVCaptureVideoPreviewLayer()
    
    //MARK: - Init Methods
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        shutterButton.layer.cornerRadius = shutterButton.frame.width / 2
        shutterButton.layer.masksToBounds = true
        previewLayer.frame = self.bounds
    }
    
    //MARK: - UI Elements
    
    // Shutter button
    let shutterButton: UIButton = {
        let button = UIButton()
        button.layer.borderWidth = 8
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.borderColor = UIColor.white.cgColor
        return button
    }()
    
    let galleryButton: UIButton = {
        let button = UIButton()
        button.setImage(.imagePlus, for: .normal)
        button.backgroundColor = .clear
        button.tintColor = .white
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let flashButton: UIButton = {
        let button = UIButton()
        button.setImage(.lightning, for: .normal)
        button.backgroundColor = .clear
        button.tintColor = .white
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let pickerView: UIPickerView = {
        let pickerView = UIPickerView()
        let rotationAngle = -90 * CGFloat.pi / 180
        pickerView.backgroundColor = .clear
        pickerView.tintColor = .white
        pickerView.transform = CGAffineTransform(rotationAngle: rotationAngle)
        pickerView.translatesAutoresizingMaskIntoConstraints = false
        return pickerView
    }()
    
    let shutterImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = .cameraTranslate
        return imageView
    }()
    
    let translateView: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let translateLabel: UILabel = {
        let label = UILabel()
        label.text = "Çevir"
        label.font = .systemFont(ofSize: 18)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        return label
    }()
    
    let translateButton: UIButton = {
        let button = UIButton()
        button.setTitle(<#T##title: String?##String?#>, for: <#T##UIControl.State#>)
        return button
    }()
    
    
}

//MARK: - SetupUI
extension CameraView {
    
    func setupUI() {
        layer.addSublayer(previewLayer)
        addSubview(shutterButton)
        addSubview(galleryButton)
        addSubview(flashButton)
        addSubview(pickerView)
        shutterButton.addSubview(shutterImageView)
        
        
        NSLayoutConstraint.activate([
            shutterButton.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
            shutterButton.centerYAnchor.constraint(equalTo: safeAreaLayoutGuide.centerYAnchor,constant: 200),
            shutterButton.heightAnchor.constraint(equalToConstant: 100),
            shutterButton.widthAnchor.constraint(equalToConstant: 100),
            
            shutterImageView.centerYAnchor.constraint(equalTo: shutterButton.centerYAnchor),
            shutterImageView.centerXAnchor.constraint(equalTo: shutterButton.centerXAnchor),
            shutterImageView.heightAnchor.constraint(equalTo: shutterButton.heightAnchor, multiplier: 0.8),
            shutterImageView.widthAnchor.constraint(equalTo: shutterButton.widthAnchor, multiplier: 0.8),
            
            galleryButton.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor,constant: 15),
            galleryButton.trailingAnchor.constraint(lessThanOrEqualTo: shutterButton.leadingAnchor,constant: -20),
            galleryButton.centerYAnchor.constraint(equalTo: shutterButton.centerYAnchor),
            galleryButton.heightAnchor.constraint(lessThanOrEqualToConstant: 100),
            
            flashButton.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor,constant: -15),
            flashButton.leadingAnchor.constraint(greaterThanOrEqualTo:shutterButton.trailingAnchor,constant: 20),
            flashButton.centerYAnchor.constraint(equalTo: shutterButton.centerYAnchor),
            flashButton.heightAnchor.constraint(lessThanOrEqualToConstant: 100),
            
            pickerView.centerXAnchor.constraint(equalTo: shutterButton.centerXAnchor),
            pickerView.centerYAnchor.constraint(equalTo: shutterButton.centerYAnchor,constant: -100),
            pickerView.heightAnchor.constraint(equalTo: safeAreaLayoutGuide.widthAnchor, multiplier: 1),
            pickerView.widthAnchor.constraint(equalToConstant: 90)
            
            
            
        ])
    }
}
