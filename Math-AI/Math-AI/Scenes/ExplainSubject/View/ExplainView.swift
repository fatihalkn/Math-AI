//
//  ExplainView.swift
//  Math-AI
//
//  Created by Fatih on 20.06.2024.
//

import Foundation
import UIKit

class ExplainView: UIView {
    
    //MARK: - Properties
    private let subjectType: SubjectItemType
    //MARK: - Init Methods
    init(subjectType: SubjectItemType) {
        self.subjectType = subjectType
        super.init(frame: .zero)
        setupUI(with: subjectType)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        explainTextView.layer.cornerRadius = 12
        dropDownButton.layer.cornerRadius = 12
        createButton.layer.cornerRadius = 12
    }
    
    //MARK: - UIElements
    
    lazy var explainTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Konu"
        label.font = .systemFont(ofSize: 15, weight: .black)
        label.textColor = .black
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var languagesTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Dil"
        label.font = .systemFont(ofSize: 15, weight: .black)
        label.textColor = .black
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var explainTextView: UITextView = {
        let textView = UITextView()
        textView.backgroundColor = .white
        textView.font = .systemFont(ofSize: 15, weight: .bold)
        textView.textContainerInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        textView.layer.borderColor = UIColor.black.cgColor
        textView.layer.borderWidth = 0.2
        textView.translatesAutoresizingMaskIntoConstraints = false
        return textView
    }()
    
    lazy var charcterLimitTitleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 15, weight: .light)
        label.text = "0"
        label.textColor = .gray
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var maxCharcterLimitTitleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 15, weight: .light)
        label.text = "/400"
        label.textColor = .gray
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var dropDownButton: UIButton = {
        let button = UIButton()
        button.setTitle("Türkçe", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 15, weight: .black)
        button.backgroundColor = .white
        button.setTitleColor(.black, for: .normal)
        button.contentHorizontalAlignment = .left
        button.layer.borderColor = UIColor.black.cgColor
        button.layer.borderWidth = 0.2
        button.contentEdgeInsets = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 0)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var createButton: UIButton = {
        let button = UIButton()
        button.setTitle("Oluştur", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 15, weight: .black)
        button.backgroundColor = .main
        button.setTitleColor(.white, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var expandDownImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "chevron.down")
        imageView.tintColor = .black
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.clipsToBounds = true
        return imageView
    }()
    
}

//MARK: - SetupUI
extension ExplainView {
    func setupUI(with type: SubjectItemType) {
        switch type {
        case .ask:
            break
        case .explain:
            break
        case .knowledgeCompetition:
            break
        case .attempt:
            break
        case .poem:
            break
        case .blog:
            break
        case .paragraph:
            break
        case .lyrics:
            break
        case .stroy:
            break
        case .writeCode:
            break
        case .checkCode:
            break
        case .optimizeCode:
            break
        case .explaneCode:
            break
        case .writeEmail:
            break
        case .emailSubject:
            break
        case .ımproveEmail:
            break
        case .simplify:
            break
        case .improve:
            break
        case .keepWriting:
            break
        case .shorten:
            break
        case .grammar:
            break
        case .translate:
            break
        case .summarizeText:
            break
        case .summarizeBook:
            break
        case .extractKeywords:
            break
        }
        addSubview(explainTitleLabel)
        addSubview(languagesTitleLabel)
        addSubview(explainTextView)
        addSubview(charcterLimitTitleLabel)
        addSubview(maxCharcterLimitTitleLabel)
        addSubview(dropDownButton)
        addSubview(createButton)
        addSubview(expandDownImageView)
        backgroundColor = .gr
        
        NSLayoutConstraint.activate([
            explainTitleLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor,constant: 10),
            explainTitleLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor,constant: 15),
            explainTitleLabel.trailingAnchor.constraint(lessThanOrEqualTo: safeAreaLayoutGuide.trailingAnchor,constant: -30),
            explainTitleLabel.heightAnchor.constraint(lessThanOrEqualToConstant: 50),
            
            explainTextView.topAnchor.constraint(equalTo: explainTitleLabel.bottomAnchor, constant: 10),
            explainTextView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor,constant: 15),
            explainTextView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -15),
            explainTextView.heightAnchor.constraint(equalTo: safeAreaLayoutGuide.heightAnchor, multiplier: 0.5),
            
            charcterLimitTitleLabel.bottomAnchor.constraint(equalTo: explainTextView.bottomAnchor,constant: -5),
            charcterLimitTitleLabel.leadingAnchor.constraint(equalTo: explainTextView.leadingAnchor, constant: 10),
            charcterLimitTitleLabel.trailingAnchor.constraint(lessThanOrEqualTo: explainTextView.trailingAnchor,constant: -50),
            charcterLimitTitleLabel.heightAnchor.constraint(equalToConstant: 30),
            
            maxCharcterLimitTitleLabel.bottomAnchor.constraint(equalTo: explainTextView.bottomAnchor,constant: -5),
            maxCharcterLimitTitleLabel.leadingAnchor.constraint(equalTo: charcterLimitTitleLabel.trailingAnchor),
            maxCharcterLimitTitleLabel.trailingAnchor.constraint(lessThanOrEqualTo: explainTextView.trailingAnchor,constant: -50),
            maxCharcterLimitTitleLabel.heightAnchor.constraint(equalToConstant: 30),
            
            languagesTitleLabel.topAnchor.constraint(equalTo: explainTextView.bottomAnchor, constant: 15),
            languagesTitleLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor,constant: 15),
            languagesTitleLabel.trailingAnchor.constraint(lessThanOrEqualTo: safeAreaLayoutGuide.trailingAnchor,constant: -30),
            languagesTitleLabel.heightAnchor.constraint(lessThanOrEqualToConstant: 50),
            
            dropDownButton.topAnchor.constraint(equalTo: languagesTitleLabel.bottomAnchor, constant: 10),
            dropDownButton.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor,constant: 15),
            dropDownButton.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -15),
            dropDownButton.heightAnchor.constraint(equalToConstant: 50),
            
            expandDownImageView.centerYAnchor.constraint(equalTo: dropDownButton.centerYAnchor),
            expandDownImageView.trailingAnchor.constraint(equalTo: dropDownButton.trailingAnchor,constant: -8),
            expandDownImageView.leadingAnchor.constraint(greaterThanOrEqualTo:dropDownButton.leadingAnchor, constant: 40),
            expandDownImageView.heightAnchor.constraint(lessThanOrEqualToConstant: 40),
            
            createButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -50),
            createButton.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor,constant: 15),
            createButton.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -15),
            createButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
}
