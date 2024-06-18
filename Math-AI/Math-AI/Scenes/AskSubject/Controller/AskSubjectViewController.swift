//
//  AskSubjectViewController.swift
//  Math-AI
//
//  Created by Fatih on 18.06.2024.
//

import Foundation
import UIKit

class AskSubjectViewController: UIViewController {
    
    //MARK: - Properties
    var askSubjectView = AskSubjectView()
    var askViewModel = AskSubjectViewModel()
    var askChatView = AskChatView()
    
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
        askViewModel.sendAskPromtText(ask: askSubjectView.askTextView.text, languages: askSubjectView.dropDownButton.titleLabel?.text ?? "BOŞ") { [weak self] response in
            guard let self = self else { return }
            if let responseText = response {
                self.navigateToChatView(with: responseText)
            }
        }
    }
    
    func navigateToChatView(with message: String) {
        let chatVC = AskChatViewController()
        chatVC.askChatViewModel.addChatMessage(message)
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
