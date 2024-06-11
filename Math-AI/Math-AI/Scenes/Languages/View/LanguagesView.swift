//
//  LanguagesView.swift
//  Math-AI
//
//  Created by Fatih on 11.06.2024.
//

import Foundation
import UIKit

class LanguagesView: UIView {
    
    //MARK: - Properties
    
    //MARK: - Init Methods
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - UI Elements
    
    let languagesCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 10
        let colletionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        colletionView.contentInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        colletionView.translatesAutoresizingMaskIntoConstraints = false
        colletionView.backgroundColor = .clear
        return colletionView
    }()
    
    let translateLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 18, weight: .semibold)
        label.text = "Çevir"
        label.textColor = .black
        label.numberOfLines = 0
        label.contentMode = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
}

//MARK: - SetupUI
extension LanguagesView {
    
    func setupUI() {
        backgroundColor = .white
        
        addSubview(languagesCollectionView)
        addSubview(translateLabel)
        
        NSLayoutConstraint.activate([
            languagesCollectionView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            languagesCollectionView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            languagesCollectionView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            
            translateLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor,constant: 10),
            translateLabel.bottomAnchor.constraint(equalTo: languagesCollectionView.topAnchor,constant: -10),
            translateLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor,constant: 10),
            translateLabel.trailingAnchor.constraint(greaterThanOrEqualTo: safeAreaLayoutGuide.leadingAnchor,constant: -50)
        ])
    }
}
