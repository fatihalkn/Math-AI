//
//  AskChoseLanguagesView.swift
//  Math-AI
//
//  Created by Fatih on 18.06.2024.
//

import Foundation
import UIKit

class AskChoseLanguagesView: UIView {
    
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
    
    let askSubjectlanguagesCollectionView: UICollectionView = {
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
    
}

//MARK: - SetupUI
extension AskChoseLanguagesView {
    
    func setupUI() {
        backgroundColor = .white
        
        
        addSubview(askSubjectlanguagesCollectionView)
     
        
        NSLayoutConstraint.activate([
    
            
            askSubjectlanguagesCollectionView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            askSubjectlanguagesCollectionView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            askSubjectlanguagesCollectionView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            askSubjectlanguagesCollectionView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor)
            
        ])
    }
}

