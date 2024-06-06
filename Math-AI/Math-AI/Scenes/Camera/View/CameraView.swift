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
}

//MARK: - SetupUI
extension CameraView {
    
    func setupUI() {
        layer.addSublayer(previewLayer)
        addSubview(shutterButton)

        
        NSLayoutConstraint.activate([
            shutterButton.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
            shutterButton.centerYAnchor.constraint(equalTo: safeAreaLayoutGuide.centerYAnchor,constant: 200),
            shutterButton.heightAnchor.constraint(equalToConstant: 100),
            shutterButton.widthAnchor.constraint(equalToConstant: 100),
            
        ])
    }
}
