//
//  ExplainViewController.swift
//  Math-AI
//
//  Created by Fatih on 20.06.2024.
//

import Foundation
import UIKit

class ExplainViewController: UIViewController {
    
    //MARK: - Properties
    var subjectType: SubjectItemType?
    var explainView: ExplainView?
    var explainViewModel = ExplainViewModel()
    
    //MARK: - Life Cycle Methods
    override func loadView() {
        super.loadView()
        if let subjectType {
            explainView = ExplainView(subjectType: subjectType)
            view = explainView!
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupDelegate()
        addTargets()
    }
    
    func setupDelegate() {
        explainView?.explainTextView.delegate = self
        
    }
    
    func addTargets() {
        explainView?.createButton.addTarget(self, action: #selector(didTappedCreateButton), for: .touchUpInside)
        explainView?.dropDownButton.addTarget(self, action: #selector(didTappedDropDownButton), for: .touchUpInside)
        
    }
    
    @objc func didTappedCreateButton() {
        guard let explain = explainView?.explainTextView.text else { return }
        guard let languages = explainView?.dropDownButton.titleLabel?.text else { return }
        let systemContent = "Verilen Konu Başlıklarını Anlaşılır Ve Kolay Hale Getir Ve açıkla"
        print(languages)
        self.explainView?.showLoading(text: "", type: .activityIndicator, interaction: false)
        DispatchQueue.main.asyncAfter(deadline: .now() + 4) {
            self.explainViewModel.sendExplainPromptText(explain: explain, languages: languages, systemContent: systemContent) { response in
                self.explainView?.removeLoading()
                if let responseText = response {
                    self.navigateToChatView(with: explain, response: responseText, languages: languages, systemContent: systemContent)
                }
            }
        }
    }
    
    @objc func didTappedDropDownButton() {
        let vc = ExplainChoseLanguagesViewController()
        vc.delegate = self
        if let sheet = vc.sheetPresentationController {
            sheet.detents = [.medium(), .large()]
            sheet.prefersGrabberVisible = false
            sheet.prefersScrollingExpandsWhenScrolledToEdge = false
            sheet.largestUndimmedDetentIdentifier = .medium
        }
        
        present(vc, animated: true)
    }
    
    func navigateToChatView(with question: String, response: String, languages: String, systemContent: String ) {
        let chatVC = ChatViewController()
        chatVC.chatViewModel.addChatMessage(question)
        chatVC.chatViewModel.addChatMessage(response)
        chatVC.systemContent = systemContent
        chatVC.language = languages
        navigationController?.pushViewController(chatVC, animated: true)
    }
    
    func checkRemainingChars() {
        let allowedChars = 0
        let charsIntextView = (explainView?.explainTextView.text.count) ?? 0
        let remainingChars = allowedChars + charsIntextView
        explainView?.charcterLimitTitleLabel.text = String(remainingChars)
        
    }
}

//MARK: - UITextViewDelegate
extension ExplainViewController: UITextViewDelegate {
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

//MARK: - ExplainChoseLanguagesViewControllerProtocol
extension ExplainViewController: ExplainChoseLanguagesViewControllerProtocol {
    func didSelectLanguages(language: String) {
        explainView?.dropDownButton.setTitle(language, for: .normal)
    }
    
}

