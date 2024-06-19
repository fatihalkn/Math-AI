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
    var askChatView = AskChatView()
    var askChatViewModel = ChatViewModel()
    
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
        askChatView.askChatTableView.reloadData()
    }
    
    override func loadView() {
        super.loadView()
        view = askChatView
    }
    
    func setupRegister() {
        askChatView.askChatTableView.register(AskChatTableViewCell.self, forCellReuseIdentifier: AskChatTableViewCell.identifier)
    }
    
    func setupDelegate() {
        askChatView.askChatTableView.delegate = self
        askChatView.askChatTableView.dataSource = self
        
        askChatView.textField.delegate = self
    }
    
    
}


//MARK: - Configure TableView
extension ChatViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return askChatViewModel.answers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: AskChatTableViewCell.identifier, for: indexPath) as! AskChatTableViewCell
        let message = askChatViewModel.answers[indexPath.row]
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
        askChatViewModel.sendAskPromtText(ask: text, languages: language ?? "BOŞ", systemContent: systemContent ?? "Boş") { response in
            if let response = response {
                DispatchQueue.main.async {
                    self.askChatViewModel.addChatMessage(text)
                    self.askChatViewModel.addChatMessage(response)
                    self.askChatView.askChatTableView.reloadData()
                }
                
            } else {
                
            }
        }
        return true
    }
}

