//
//  AskChatTableViewCell.swift
//  Math-AI
//
//  Created by Fatih on 18.06.2024.
//

import UIKit

class AskChatTableViewCell: UITableViewCell {

    //MARK: - Properties
    static let identifier = "AskChatTableViewCell"
    var textLeading: NSLayoutConstraint!
    var textTrainling: NSLayoutConstraint!
    var imageLeading: NSLayoutConstraint!
    var imageTrainling: NSLayoutConstraint!
    
    //MARK: - Init Methods
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    //MARK: - UI Elements
    let bubleView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 10
        view.backgroundColor = .systemBlue
        return view
    }()
    
    let chatTextLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.tintColor = .black
        imageView.image = .person
        return imageView
    }()
    
    
    
    
}

//MARK: - SetupUI
extension AskChatTableViewCell {
    
    
    
    func configureForMassage(message: String, isUser: Bool) {
        chatTextLabel.text = message
        if isUser {
            bubleView.backgroundColor = .systemBlue
            profileImageView.image = .person
            imageLeading.isActive = true
            textLeading.isActive = true
        } else {
            bubleView.backgroundColor = .systemGray
            profileImageView.image = .robot
            imageLeading.isActive = true
            textLeading.isActive = true
        }
    }
        
    func setupUI() {
        addSubview(bubleView)
        addSubview(chatTextLabel)
        addSubview(profileImageView)
        
        NSLayoutConstraint.activate([
            profileImageView.topAnchor.constraint(equalTo: topAnchor,constant: 10),
            profileImageView.heightAnchor.constraint(equalToConstant: 32),
            profileImageView.widthAnchor.constraint(equalToConstant: 32),
            
            chatTextLabel.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            chatTextLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16),
            chatTextLabel.widthAnchor.constraint(lessThanOrEqualToConstant: 300),
            
            bubleView.topAnchor.constraint(equalTo: chatTextLabel.topAnchor,constant: -8),
            bubleView.leadingAnchor.constraint(equalTo: chatTextLabel.leadingAnchor,constant: -8),
            bubleView.trailingAnchor.constraint(equalTo: chatTextLabel.trailingAnchor, constant: 10),
            bubleView.bottomAnchor.constraint(equalTo: chatTextLabel.bottomAnchor, constant: 10)
        ])
        
        imageLeading = profileImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10)
        imageTrainling = profileImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10)
        
        textLeading = chatTextLabel.leadingAnchor.constraint(equalTo: profileImageView.trailingAnchor, constant: 10)
        textTrainling = chatTextLabel.trailingAnchor.constraint(equalTo: profileImageView.leadingAnchor, constant: -10)
        
        imageLeading.isActive = true
        textLeading.isActive = true
        
    }
  }

