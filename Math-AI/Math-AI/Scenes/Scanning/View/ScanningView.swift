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
}

//MARK: - SetupUI
extension ScanningView {
    func setupUI() {
        backgroundColor = .gray
        addSubview(scanningContentView)
        addSubview(photoBackView)
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
            scanningContentView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
            
        ])
    }
}
