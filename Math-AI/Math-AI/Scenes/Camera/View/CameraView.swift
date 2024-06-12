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
        
        translateView.layer.cornerRadius = translateView.frame.height / 2
        translateView.layer.masksToBounds = true
        
        scanButton.layer.cornerRadius = 25
        scanButton.layer.masksToBounds = true
        retakeButton.layer.cornerRadius = 25
        retakeButton.layer.masksToBounds = true
        
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
        view.backgroundColor = .clear
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let translateLabel: UILabel = {
        let label = UILabel()
        label.text = "Çevir"
        label.font = .systemFont(ofSize: 12, weight: .regular)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .lightText
        return label
    }()
    
    let translateButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Türkçe", for: .normal)
        button.backgroundColor = .clear
        return button
    }()
    
    let translateButtonImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = .expandDown
        imageView.tintColor = .white
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    let retakeButton: UIButton = {
        let retakeButton = UIButton()
        retakeButton.setTitle("Tekrar Çek", for: .normal)
        retakeButton.backgroundColor = .clear
        retakeButton.titleLabel?.font = .systemFont(ofSize: 18, weight: .black)
        retakeButton.tintColor = .white
        retakeButton.translatesAutoresizingMaskIntoConstraints = false
        return retakeButton
    }()
    
    let scanButton: UIButton = {
        let scanButton = UIButton()
        scanButton.setTitle("Tara", for: .normal)
        scanButton.titleLabel?.font = .systemFont(ofSize: 18, weight: .black)
        scanButton.backgroundColor = .main
        scanButton.tintColor = .white
        scanButton.translatesAutoresizingMaskIntoConstraints = false
        return scanButton
    }()
    
    let croppedImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.isUserInteractionEnabled = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
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
        addSubview(translateView)
        retakeButton.isHidden = true
        scanButton.isHidden = true
        croppedImageView.isHidden = true
        translateView.addSubview(translateLabel)
        translateView.addSubview(translateButton)
        translateView.addSubview(translateButtonImageView)
        shutterButton.addSubview(shutterImageView)
        addSubview(croppedImageView)
        croppedImageView.addSubview(retakeButton)
        croppedImageView.addSubview(scanButton)
        
        NSLayoutConstraint.activate([
            shutterButton.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
            shutterButton.centerYAnchor.constraint(equalTo: safeAreaLayoutGuide.centerYAnchor,constant: 150),
            shutterButton.heightAnchor.constraint(equalToConstant: 90),
            shutterButton.widthAnchor.constraint(equalToConstant: 90),
            
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
            pickerView.widthAnchor.constraint(equalToConstant: 90),
            
            translateView.bottomAnchor.constraint(equalTo: shutterButton.topAnchor,constant: -95),
            translateView.leadingAnchor.constraint(lessThanOrEqualTo:safeAreaLayoutGuide.leadingAnchor, constant: 120),
            translateView.trailingAnchor.constraint(greaterThanOrEqualTo:safeAreaLayoutGuide.trailingAnchor, constant: -120),
            translateView.heightAnchor.constraint(equalToConstant: 30),
            
            translateLabel.centerXAnchor.constraint(equalTo: translateView.centerXAnchor,constant: -50),
            translateLabel.centerYAnchor.constraint(equalTo: translateView.centerYAnchor),
            translateLabel.heightAnchor.constraint(lessThanOrEqualToConstant: 30),
            translateLabel.widthAnchor.constraint(greaterThanOrEqualToConstant: 30),
            
            translateButton.topAnchor.constraint(equalTo: translateView.topAnchor),
            translateButton.leadingAnchor.constraint(equalTo: translateLabel.leadingAnchor,constant: 35),
            translateButton.trailingAnchor.constraint(equalTo: translateButtonImageView.leadingAnchor),
            translateButton.heightAnchor.constraint(lessThanOrEqualToConstant: 30),
            
            translateButtonImageView.topAnchor.constraint(equalTo: translateButton.topAnchor),
            translateButtonImageView.trailingAnchor.constraint(equalTo: translateView.trailingAnchor),
            translateButtonImageView.leadingAnchor.constraint(equalTo: translateButton.trailingAnchor),
            translateButtonImageView.heightAnchor.constraint(equalToConstant: 30),
            
            croppedImageView.topAnchor.constraint(equalTo: self.topAnchor),
            croppedImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            croppedImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            croppedImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            
            retakeButton.leadingAnchor.constraint(equalTo: croppedImageView.leadingAnchor, constant: 20),
            retakeButton.bottomAnchor.constraint(equalTo: croppedImageView.safeAreaLayoutGuide.bottomAnchor, constant: -100),
            retakeButton.heightAnchor.constraint(equalToConstant: 50),
            retakeButton.widthAnchor.constraint(equalToConstant: 120),
                
            scanButton.trailingAnchor.constraint(equalTo: croppedImageView.trailingAnchor, constant: -20),
            scanButton.bottomAnchor.constraint(equalTo: croppedImageView.safeAreaLayoutGuide.bottomAnchor, constant: -100),
            scanButton.heightAnchor.constraint(equalToConstant: 50),
            scanButton.widthAnchor.constraint(equalToConstant: 120)
            
            
            
        ])
    }
}
