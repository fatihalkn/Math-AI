//
//  KnowledgeCompetitionDifficultyCell.swift
//  Math-AI
//
//  Created by Fatih on 20.06.2024.
//

import UIKit

class KnowledgeCompetitionDifficultyCell: UICollectionViewCell {
    static let identifier = "KnowledgeCompetitionDifficultyCell"
    
    override init(frame: CGRect) {
        super .init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let languages: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 18, weight: .semibold)
        label.textColor = .black
        label.numberOfLines = 0
        label.contentMode = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
}

//MARK: - SetupUI
extension KnowledgeCompetitionDifficultyCell {
    func setupUI() {
        addSubview(languages)
        
        backgroundColor = .mainGray
        
        NSLayoutConstraint.activate([
            languages.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
            languages.centerYAnchor.constraint(equalTo: safeAreaLayoutGuide.centerYAnchor),
            languages.widthAnchor.constraint(lessThanOrEqualToConstant: 130),
            languages.heightAnchor.constraint(lessThanOrEqualToConstant: 50),
            
        ])
    }
}
