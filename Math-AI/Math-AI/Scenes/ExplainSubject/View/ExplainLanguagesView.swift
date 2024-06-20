//
//  ExplainLanguagesView.swift
//  Math-AI
//
//  Created by Fatih on 20.06.2024.
//

import Foundation
import UIKit

class ExplainLanguagesView: UIView {
    
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
    
    //MARK: - UIElements
    
    let explainLanguagesCollectionView: UICollectionView = {
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
extension ExplainLanguagesView {
    
    func setupUI() {
        backgroundColor = .white
        
        
        addSubview(explainLanguagesCollectionView)
     
        
        NSLayoutConstraint.activate([
    
            
            explainLanguagesCollectionView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            explainLanguagesCollectionView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            explainLanguagesCollectionView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            explainLanguagesCollectionView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor)
            
        ])
    }
}
