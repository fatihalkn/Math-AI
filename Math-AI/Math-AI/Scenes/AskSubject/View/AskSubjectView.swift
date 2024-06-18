//
//  AskSubjectView.swift
//  Math-AI
//
//  Created by Fatih on 18.06.2024.
//

import Foundation
import UIKit

class AskSubjectView: UIView {
    //MARK: - Properties
    
    //MARK: - Init Methods
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .gr
        setupUI()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        askTextView.layer.cornerRadius = 12
        dropDownButton.layer.cornerRadius = 12
        createButton.layer.cornerRadius = 12
    }
    
    
    //MARK: - UI Elements
    
    lazy var askTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Soru"
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
    
    lazy var askTextView: UITextView = {
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
extension AskSubjectView {
    func setupUI() {
        addSubview(askTextView)
        addSubview(askTitleLabel)
        addSubview(dropDownButton)
        addSubview(languagesTitleLabel)
        addSubview(createButton)
        addSubview(charcterLimitTitleLabel)
        addSubview(maxCharcterLimitTitleLabel)
        dropDownButton.addSubview(expandDownImageView)
        NSLayoutConstraint.activate([
            askTitleLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor,constant: 10),
            askTitleLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor,constant: 15),
            askTitleLabel.trailingAnchor.constraint(lessThanOrEqualTo: safeAreaLayoutGuide.trailingAnchor,constant: -30),
            askTitleLabel.heightAnchor.constraint(lessThanOrEqualToConstant: 50),
            
            askTextView.topAnchor.constraint(equalTo: askTitleLabel.bottomAnchor, constant: 10),
            askTextView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor,constant: 15),
            askTextView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -15),
            askTextView.heightAnchor.constraint(equalTo: safeAreaLayoutGuide.heightAnchor, multiplier: 0.5),
            
            charcterLimitTitleLabel.bottomAnchor.constraint(equalTo: askTextView.bottomAnchor,constant: -5),
            charcterLimitTitleLabel.leadingAnchor.constraint(equalTo: askTextView.leadingAnchor, constant: 10),
            charcterLimitTitleLabel.trailingAnchor.constraint(lessThanOrEqualTo: askTextView.trailingAnchor,constant: -50),
            charcterLimitTitleLabel.heightAnchor.constraint(equalToConstant: 30),
            
            maxCharcterLimitTitleLabel.bottomAnchor.constraint(equalTo: askTextView.bottomAnchor,constant: -5),
            maxCharcterLimitTitleLabel.leadingAnchor.constraint(equalTo: charcterLimitTitleLabel.trailingAnchor),
            maxCharcterLimitTitleLabel.trailingAnchor.constraint(lessThanOrEqualTo: askTextView.trailingAnchor,constant: -50),
            maxCharcterLimitTitleLabel.heightAnchor.constraint(equalToConstant: 30),
            
            languagesTitleLabel.topAnchor.constraint(equalTo: askTextView.bottomAnchor, constant: 15),
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
