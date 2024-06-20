//
//  KnowledgeCompetitionView.swift
//  Math-AI
//
//  Created by Fatih on 20.06.2024.
//

import Foundation
import UIKit

class KnowledgeCompetitionView: UIView {
    
    //MARK: - Properties
    
    //MARK: - Init Methods
    
    override init(frame: CGRect) {
        super .init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        knowledgeCompetitionTextView.layer.cornerRadius = 12
        dropDownButton.layer.cornerRadius = 12
        difficultyButton.layer.cornerRadius = 12
        createButton.layer.cornerRadius = 12
    }
    
    //MARK: - UIElements
    
    lazy var knowledgeCompetitionTitleLabel: UILabel = {
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
    
    lazy var knowledgeCompetitionTextView: UITextView = {
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
    
    lazy var difficultyButton: UIButton = {
        let button = UIButton()
        button.setTitle("Zorluk", for: .normal)
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
    
    lazy var difficultyTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Zorluk"
        label.font = .systemFont(ofSize: 15, weight: .black)
        label.textColor = .black
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
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
    
    lazy var difficultyExpandDownImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "chevron.down")
        imageView.tintColor = .black
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.clipsToBounds = true
        return imageView
    }()
    
}

extension KnowledgeCompetitionView {
    func setupUI() {
        addSubview(knowledgeCompetitionTitleLabel)
        addSubview(languagesTitleLabel)
        addSubview(knowledgeCompetitionTextView)
        addSubview(charcterLimitTitleLabel)
        addSubview(maxCharcterLimitTitleLabel)
        addSubview(dropDownButton)
        addSubview(createButton)
        addSubview(difficultyButton)
        addSubview(difficultyTitleLabel)
        addSubview(expandDownImageView)
        addSubview(difficultyExpandDownImageView)
        backgroundColor = .gr
        
        NSLayoutConstraint.activate([
            knowledgeCompetitionTitleLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor,constant: 10),
            knowledgeCompetitionTitleLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor,constant: 15),
            knowledgeCompetitionTitleLabel.trailingAnchor.constraint(lessThanOrEqualTo: safeAreaLayoutGuide.trailingAnchor,constant: -30),
            knowledgeCompetitionTitleLabel.heightAnchor.constraint(lessThanOrEqualToConstant: 50),
            
            knowledgeCompetitionTextView.topAnchor.constraint(equalTo: knowledgeCompetitionTitleLabel.bottomAnchor, constant: 10),
            knowledgeCompetitionTextView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor,constant: 15),
            knowledgeCompetitionTextView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -15),
            knowledgeCompetitionTextView.heightAnchor.constraint(equalTo: safeAreaLayoutGuide.heightAnchor, multiplier: 0.5),
            
            charcterLimitTitleLabel.bottomAnchor.constraint(equalTo: knowledgeCompetitionTextView.bottomAnchor,constant: -5),
            charcterLimitTitleLabel.leadingAnchor.constraint(equalTo: knowledgeCompetitionTextView.leadingAnchor, constant: 10),
            charcterLimitTitleLabel.trailingAnchor.constraint(lessThanOrEqualTo: knowledgeCompetitionTextView.trailingAnchor,constant: -50),
            charcterLimitTitleLabel.heightAnchor.constraint(equalToConstant: 30),
            
            maxCharcterLimitTitleLabel.bottomAnchor.constraint(equalTo: knowledgeCompetitionTextView.bottomAnchor,constant: -5),
            maxCharcterLimitTitleLabel.leadingAnchor.constraint(equalTo: charcterLimitTitleLabel.trailingAnchor),
            maxCharcterLimitTitleLabel.trailingAnchor.constraint(lessThanOrEqualTo: knowledgeCompetitionTextView.trailingAnchor,constant: -50),
            maxCharcterLimitTitleLabel.heightAnchor.constraint(equalToConstant: 30),
            
            languagesTitleLabel.topAnchor.constraint(equalTo: knowledgeCompetitionTextView.bottomAnchor, constant: 15),
            languagesTitleLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor,constant: 15),
            languagesTitleLabel.trailingAnchor.constraint(lessThanOrEqualTo: safeAreaLayoutGuide.trailingAnchor,constant: -30),
            languagesTitleLabel.heightAnchor.constraint(lessThanOrEqualToConstant: 50),
            
            dropDownButton.topAnchor.constraint(equalTo: languagesTitleLabel.bottomAnchor, constant: 10),
            dropDownButton.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor,constant: 15),
            dropDownButton.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -15),
            dropDownButton.heightAnchor.constraint(equalToConstant: 50),
            
            difficultyButton.topAnchor.constraint(equalTo: dropDownButton.bottomAnchor, constant: 35),
            difficultyButton.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor,constant: 15),
            difficultyButton.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -15),
            difficultyButton.heightAnchor.constraint(equalToConstant: 50),
            
            difficultyTitleLabel.bottomAnchor.constraint(equalTo: difficultyButton.topAnchor,constant: -9),
            difficultyTitleLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor,constant: 15),
            difficultyTitleLabel.trailingAnchor.constraint(lessThanOrEqualTo: safeAreaLayoutGuide.trailingAnchor,constant: -15),
            difficultyTitleLabel.heightAnchor.constraint(lessThanOrEqualToConstant: 50),
            
            expandDownImageView.centerYAnchor.constraint(equalTo: dropDownButton.centerYAnchor),
            expandDownImageView.trailingAnchor.constraint(equalTo: dropDownButton.trailingAnchor,constant: -8),
            expandDownImageView.leadingAnchor.constraint(greaterThanOrEqualTo:dropDownButton.leadingAnchor, constant: 40),
            expandDownImageView.heightAnchor.constraint(lessThanOrEqualToConstant: 40),
            
            difficultyExpandDownImageView.centerYAnchor.constraint(equalTo: difficultyButton.centerYAnchor),
            difficultyExpandDownImageView.trailingAnchor.constraint(equalTo: difficultyButton.trailingAnchor,constant: -8),
            difficultyExpandDownImageView.leadingAnchor.constraint(greaterThanOrEqualTo:difficultyButton.leadingAnchor, constant: 40),
            difficultyExpandDownImageView.heightAnchor.constraint(lessThanOrEqualToConstant: 40),
            
            createButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -50),
            createButton.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor,constant: 15),
            createButton.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -15),
            createButton.heightAnchor.constraint(equalToConstant: 50),
            
            
        ])
      }
    }
