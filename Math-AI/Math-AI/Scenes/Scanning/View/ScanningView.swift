//
//  ScanningView.swift
//  Math-AI
//
//  Created by Fatih on 10.06.2024.
//

import Foundation
import UIKit

class ScanningView: UIView {
    
    //MARK: - Properties
    
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
        scanButton.layer.cornerRadius = 15
        scanButton.layer.masksToBounds = true
        
        cancelButton.layer.cornerRadius = 15
        cancelButton.layer.masksToBounds = true
    }
    
    //MARK: - UI Elements
    
    let selectedGalleryImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        return imageView
    }()
    
    let scanningContentView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        return view
    }()
    
    let photoBackView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .black
        return view
    }()
    
    let contentView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
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
    
    let cancelButton: UIButton = {
        let scanButton = UIButton()
        scanButton.setTitle("İptal", for: .normal)
        scanButton.titleLabel?.font = .systemFont(ofSize: 18, weight: .black)
        scanButton.backgroundColor = .darkGray
        scanButton.tintColor = .white
        scanButton.translatesAutoresizingMaskIntoConstraints = false
        return scanButton
    }()
}

//MARK: - SetupUI
extension ScanningView {
    func setupUI() {
        backgroundColor = .black
        addSubview(scanningContentView)
        addSubview(photoBackView)
        addSubview(contentView)
        contentView.addSubview(scanButton)
        contentView.addSubview(cancelButton)
        photoBackView.addSubview(selectedGalleryImageView)
        
        NSLayoutConstraint.activate([
            photoBackView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            photoBackView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            photoBackView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            photoBackView.heightAnchor.constraint(equalTo: safeAreaLayoutGuide.heightAnchor, multiplier: 0.8),
            
            selectedGalleryImageView.topAnchor.constraint(equalTo: photoBackView.topAnchor,constant: 15),
            selectedGalleryImageView.leadingAnchor.constraint(equalTo: photoBackView.leadingAnchor,constant: 15),
            selectedGalleryImageView.trailingAnchor.constraint(equalTo: photoBackView.trailingAnchor,constant: -15),
            selectedGalleryImageView.bottomAnchor.constraint(equalTo: photoBackView.bottomAnchor, constant: -15),
            
            scanningContentView.topAnchor.constraint(equalTo: photoBackView.bottomAnchor),
            scanningContentView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            scanningContentView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            scanningContentView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            
            contentView.topAnchor.constraint(equalTo: photoBackView.bottomAnchor,constant: 20),
            contentView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            contentView.heightAnchor.constraint(equalToConstant: 100),
            
            scanButton.centerXAnchor.constraint(equalTo: contentView.centerXAnchor,constant: 100),
            scanButton.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            scanButton.heightAnchor.constraint(equalToConstant: 50),
            scanButton.widthAnchor.constraint(equalToConstant: 150),
            
            cancelButton.centerXAnchor.constraint(equalTo: contentView.centerXAnchor,constant: -100),
            cancelButton.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            cancelButton.heightAnchor.constraint(equalToConstant: 50),
            cancelButton.widthAnchor.constraint(equalToConstant: 150)
            
            
        ])
    }
}
