//
//  TableViewHeaderView.swift
//  Math-AI
//
//  Created by Fatih on 14.06.2024.
//

import Foundation
import UIKit

class TableViewHeaderView: UIView {
    
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
    
    lazy var favoriteCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 10
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.contentInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .clear
        collectionView.showsHorizontalScrollIndicator = false
        return collectionView
    }()
    
    lazy var headerViewTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Favoriler"
        label.font = .systemFont(ofSize: 16, weight: .black)
        label.textColor  = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        return label
    }()
    
    lazy var emptyLabal: UILabel = {
            let label = UILabel()
            label.text = "Favori Listeniz Boş"
        label.textColor = .gray
            label.textAlignment = .center
            label.font = .systemFont(ofSize: 20)
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()
    
    public func showEmptyStateLabel() {
        favoriteCollectionView.addSubview(emptyLabal)
        NSLayoutConstraint.activate([
            emptyLabal.centerXAnchor.constraint(equalTo: favoriteCollectionView.centerXAnchor),
            emptyLabal.centerYAnchor.constraint(equalTo: favoriteCollectionView.centerYAnchor)
        ])
    }
    
    public func hideEmptyStateLabel() {
        emptyLabal.removeFromSuperview()
    }
    
    
}

extension TableViewHeaderView {
    
    func setupUI() {
        backgroundColor = .clear
        addSubview(favoriteCollectionView)
        addSubview(headerViewTitleLabel)
        
        
        NSLayoutConstraint.activate([
            headerViewTitleLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor,constant: 10),
            headerViewTitleLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            headerViewTitleLabel.trailingAnchor.constraint(lessThanOrEqualTo: safeAreaLayoutGuide.trailingAnchor,constant: -30),
            
            favoriteCollectionView.topAnchor.constraint(equalTo: headerViewTitleLabel.bottomAnchor, constant: 10),
            favoriteCollectionView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            favoriteCollectionView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            favoriteCollectionView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            
            
        ])
    }
}

