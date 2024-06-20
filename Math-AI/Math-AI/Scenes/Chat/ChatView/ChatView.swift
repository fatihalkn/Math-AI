//
//  AskChatView.swift
//  Math-AI
//
//  Created by Fatih on 18.06.2024.
//

import Foundation
import UIKit

class ChatView: UIView {
    
    //MARK: - Properties
    
    //MARK: - Init Methods
    override init(frame: CGRect) {
        super.init(frame: frame)  
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
      
    }
    
    
    
    //MARK: - UI Elements
    
    let askChatTableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.separatorStyle = .none
        tableView.backgroundColor = .white
        return tableView
    }()
    
    let textField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = .gr
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: textField.frame.height))
        textField.leftView = paddingView
        textField.placeholder = "Mesajınızı buraya yazın"
        textField.leftViewMode = .always
        textField.autocapitalizationType = .none
        textField.autocorrectionType = .no
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.returnKeyType = .send
        return textField
    }()
    
    let sendImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "paperplane")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.tintColor = .gray
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
}

//MARK: - ConfigureUI
extension ChatView {
    func configureUI() {
        backgroundColor = .white
        addSubview(askChatTableView)
        addSubview(textField)
        addSubview(sendImageView)
        
        NSLayoutConstraint.activate([
            textField.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            textField.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            textField.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            textField.heightAnchor.constraint(equalToConstant: 60),
            
            sendImageView.centerYAnchor.constraint(equalTo: textField.centerYAnchor),
            sendImageView.trailingAnchor.constraint(equalTo: textField.trailingAnchor,constant: -20),
            sendImageView.leadingAnchor.constraint(greaterThanOrEqualTo:textField.leadingAnchor, constant: 50),
            sendImageView.heightAnchor.constraint(equalToConstant: 40),
            
            askChatTableView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            askChatTableView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            askChatTableView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            askChatTableView.bottomAnchor.constraint(equalTo: textField.topAnchor)
        ])
    }
}


