//
//  AskChatViewController.swift
//  Math-AI
//
//  Created by Fatih on 18.06.2024.
//

import Foundation
import UIKit

class ChatViewController: UIViewController {
    
    //MARK: - Properties
    var chatView = ChatView()
    var chatViewModel = ChatViewModel()
    
    var systemContent: String?
    var language: String?
    
    
    //MARK: - Life Cycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setupRegister()
        setupDelegate()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        chatView.askChatTableView.reloadData()
    }
    
    override func loadView() {
        super.loadView()
        view = chatView
    }
    
    func setupRegister() {
        chatView.askChatTableView.register(AskChatTableViewCell.self, forCellReuseIdentifier: AskChatTableViewCell.identifier)
    }
    
    func setupDelegate() {
        chatView.askChatTableView.delegate = self
        chatView.askChatTableView.dataSource = self
        
        chatView.textField.delegate = self
    }
    
    
}


//MARK: - Configure TableView
extension ChatViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return chatViewModel.answers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: AskChatTableViewCell.identifier, for: indexPath) as! AskChatTableViewCell
        let message = chatViewModel.answers[indexPath.row]
        cell.configureForMassage(message: message, isUser: indexPath.row % 2 == 0)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
    }
}

//MARK: - UITextFieldDelegate
extension ChatViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        guard let text = textField.text, !text.isEmpty else { return false }
        
        textField.text = ""
        chatViewModel.sendAskPromtText(ask: text, languages: language ?? "BOŞ", systemContent: systemContent ?? "Boş") { response in
            if let response = response {
                DispatchQueue.main.async {
                    self.chatViewModel.addChatMessage(text)
                    self.chatViewModel.addChatMessage(response)
                    self.chatView.askChatTableView.reloadData()
                }
                
            } else {
                
            }
        }
        return true
    }
}

