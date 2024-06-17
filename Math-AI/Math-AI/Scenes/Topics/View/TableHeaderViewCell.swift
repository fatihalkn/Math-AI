//
//  TableHeaderViewCell.swift
//  Math-AI
//
//  Created by Fatih on 17.06.2024.
//

import UIKit

class TableHeaderViewCell: UICollectionViewCell {
    
    static let identifier = "TableHeaderViewCell"
    
    private let favoriteAddContainer: UIView = {
        let view = UIView()
        view.clipsToBounds = true
        view.backgroundColor = .gr
        view.layer.borderColor = UIColor.red.cgColor
        view.layer.borderWidth = 0.5
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.masksToBounds = true
        return view
    }()
    
     let favoriteAddIconImageView: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.image = .iconsMathSolver5
        image.clipsToBounds = true
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
 
    override init(frame: CGRect) {
        super .init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        favoriteAddContainer.layer.cornerRadius = favoriteAddContainer.frame.height / 2
        favoriteAddContainer.layer.masksToBounds = true
    }
    
    func configure(with itemType: SubjectItemType) {
        switch itemType {
        case .ask:
            favoriteAddIconImageView.image = .subjectAsk
        case .explain:
            favoriteAddIconImageView.image = .subjectExplain
        case .knowledgeCompetition:
            favoriteAddIconImageView.image = .subjectTrivia
        case .attempt:
            favoriteAddIconImageView.image = .subjectEssay
        case .poem:
            favoriteAddIconImageView.image = .subjectPoem
        case .blog:
            favoriteAddIconImageView.image = .subjectBlog
        case .paragraph:
            favoriteAddIconImageView.image = .subjectWriteParagraph
        case .lyrics:
            favoriteAddIconImageView.image = .subjectLyrics
        case .stroy:
            favoriteAddIconImageView.image = .subjectStory
        case .writeCode:
            favoriteAddIconImageView.image = .subjectWriteCode
        case .checkCode:
            favoriteAddIconImageView.image = .subjectExplainCode
        case .optimizeCode:
            favoriteAddIconImageView.image = .iconsMathSolver12
        case .writeEmail:
            favoriteAddIconImageView.image = .subjectWriteEmail
        case .emailSubject:
            favoriteAddIconImageView.image = .subjectEmailSubject
        case .ımproveEmail:
            favoriteAddIconImageView.image = .subjectImproveEmail
        case .simplify:
            favoriteAddIconImageView.image = .subjectSimplify
        case .improve:
            favoriteAddIconImageView.image = .subjectImprove
        case .keepWriting:
            favoriteAddIconImageView.image = .subjectContinueWriting
        case .shorten:
            favoriteAddIconImageView.image = .subjectShorten
        case .grammar:
            favoriteAddIconImageView.image = .subjectGrammar
        case .translate:
            favoriteAddIconImageView.image = .iconsMathSolver2
        case .summarizeText:
            favoriteAddIconImageView.image = .subjectSummarizeText
        case .summarizeBook:
            favoriteAddIconImageView.image = .subjectBookSummarize
        case .extractKeywords:
            favoriteAddIconImageView.image = .subjectExtractKeywords
        case .explaneCode:
            favoriteAddIconImageView.image = .subjectExplainCode
        }
    }
}

//MARK: - SetupUI
extension TableHeaderViewCell {
    func setupUI() {
        addSubview(favoriteAddContainer)
        favoriteAddContainer.addSubview(favoriteAddIconImageView)
        
        NSLayoutConstraint.activate([
            favoriteAddContainer.centerXAnchor.constraint(equalTo: centerXAnchor),
            favoriteAddContainer.centerYAnchor.constraint(equalTo: centerYAnchor),
            favoriteAddContainer.heightAnchor.constraint(equalToConstant: 60),
            favoriteAddContainer.widthAnchor.constraint(equalToConstant: 60),
            
            favoriteAddIconImageView.centerXAnchor.constraint(equalTo: favoriteAddContainer.centerXAnchor),
            favoriteAddIconImageView.centerYAnchor.constraint(equalTo: favoriteAddContainer.centerYAnchor),
            favoriteAddIconImageView.heightAnchor.constraint(equalToConstant: 50),
            favoriteAddIconImageView.widthAnchor.constraint(equalToConstant: 50)
        ])
    }
}
