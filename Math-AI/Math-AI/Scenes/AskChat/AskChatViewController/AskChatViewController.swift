//
//  AskChatViewController.swift
//  Math-AI
//
//  Created by Fatih on 18.06.2024.
//

import Foundation
import UIKit

class AskChatViewController: UIViewController {
    
    //MARK: - Properties
    var askChatView = AskChatView()
    var askChatViewModel = AskChatViewModel()
    
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
extension AskChatViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return askChatViewModel.answers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: AskChatTableViewCell.identifier, for: indexPath) as! AskChatTableViewCell
        cell.chatTextLabel.text = askChatViewModel.answers[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
    }
}

//MARK: - UITextFieldDelegate
extension AskChatViewController: UITextFieldDelegate {
    
}
