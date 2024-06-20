//
//  AskSubjectViewController.swift
//  Math-AI
//
//  Created by Fatih on 18.06.2024.
//

import Foundation
import UIKit
import ProgressHUD

class AskSubjectViewController: UIViewController {
    
    //MARK: - Properties
    var askSubjectView = AskSubjectView()
    var askViewModel = AskSubjectViewModel()
    
    //MARK: - Life Cycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setupDelegate()
        addTarget()
    }
    
    override func loadView() {
        super.loadView()
        view = askSubjectView
    }
    
    func setupDelegate() {
        askSubjectView.askTextView.delegate = self
    }
    
    func checkRemainingChars() {
        let allowedChars = 0
        let charsIntextView = (askSubjectView.askTextView.text.count)
        let remainingChars = allowedChars + charsIntextView
        askSubjectView.charcterLimitTitleLabel.text = String(remainingChars)
        
    }
    
    func addTarget() {
        askSubjectView.dropDownButton.addTarget(self, action: #selector(clickedDropDownButton), for: .touchUpInside)
        askSubjectView.createButton.addTarget(self, action: #selector(clickedCreatedButton), for: .touchUpInside)
    }
    
    @objc func clickedCreatedButton() {
        guard let question = askSubjectView.askTextView.text else { return }
        guard let language = askSubjectView.dropDownButton.titleLabel?.text else { return }
        let systemContent = "Sen Kullanıcıya Herhangi bir konuda size yardımcı olabilirsin. "
        print(language)
        self.askSubjectView.showLoading(text: "", type: .activityIndicator, interaction: false)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 4) {
            self.askViewModel.sendAskPromtText(ask: question, languages: language, systemContent: systemContent) { resposne in
                self.askSubjectView.removeLoading()
        if let responseText = resposne {
            self.navigateToChatView(with: question, response: responseText,languages: language, systemContent: systemContent)
        }
    }
        }
                
    }
    
    func navigateToChatView(with question: String, response: String, languages: String, systemContent: String ) {
        let chatVC = ChatViewController()
        chatVC.chatViewModel.addChatMessage(question)
        chatVC.chatViewModel.addChatMessage(response)
        chatVC.systemContent = systemContent
        chatVC.language = languages
        navigationController?.pushViewController(chatVC, animated: true)
    }
    
    @objc func clickedDropDownButton() {
        let vc = AskChoseLanguagesViewController()
        vc.delegate = self
        if let sheet = vc.sheetPresentationController {
            sheet.detents = [.medium(), .large()]
            sheet.prefersGrabberVisible = false
            sheet.prefersScrollingExpandsWhenScrolledToEdge = false
            sheet.largestUndimmedDetentIdentifier = .medium
        }
        
        present(vc, animated: true)
    }
    
    
    
}

//MARK: - AskChoseLanguagesViewControllerProtocol
extension AskSubjectViewController: AskChoseLanguagesViewControllerProtocol {
    func didSelectLanguage(language: String) {
        askSubjectView.dropDownButton.setTitle(language, for: .normal)
    }
    
    
}

//MARK: - UITextViewDelegate
extension AskSubjectViewController: UITextViewDelegate {
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        let newText = (textView.text as NSString).replacingCharacters(in: range, with: text)
        if newText.count > 400 {
            return false
        } else {
            return true
        }
    }
    
    func textViewDidChange(_ textView: UITextView) {
        checkRemainingChars()
    }
}
