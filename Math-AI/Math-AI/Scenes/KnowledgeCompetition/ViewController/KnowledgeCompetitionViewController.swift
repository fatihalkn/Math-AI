//
//  KnowledgeCompetitionViewController.swift
//  Math-AI
//
//  Created by Fatih on 20.06.2024.
//

import Foundation
import UIKit

class KnowledgeCompetitionViewController: UIViewController {
    
    //MARK: - Properties
    var knowLedgeCompetitionView = KnowledgeCompetitionView()
    var chatView = ChatView()
    var knowLedgeViewModel = KnowledgeCompetitionViewModel()
    
    //MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupDelegate()
        addTarget()
    }
    
    override func loadView() {
        super.loadView()
        view = knowLedgeCompetitionView
    }
    
    func setupDelegate() {
        knowLedgeCompetitionView.knowledgeCompetitionTextView.delegate = self
        
    }
    
    func addTarget() {
        knowLedgeCompetitionView.dropDownButton.addTarget(self, action: #selector(clickedDropDownButton), for: .touchUpInside)
        knowLedgeCompetitionView.createButton.addTarget(self, action: #selector(clickedCreatedButton), for: .touchUpInside)
        knowLedgeCompetitionView.difficultyButton.addTarget(self, action: #selector(clickedDifficultyButton), for: .touchUpInside)
    }
    
    @objc func clickedDropDownButton() {
        let vc = KnowledgeCompetitionLanguagesViewController()
        vc.delegate = self
        if let sheet = vc.sheetPresentationController {
            sheet.detents = [.medium(), .large()]
            sheet.prefersGrabberVisible = false
            sheet.prefersScrollingExpandsWhenScrolledToEdge = false
            sheet.largestUndimmedDetentIdentifier = .medium
        }
        
        present(vc, animated: true)
    }
    
    @objc func clickedDifficultyButton() {
        let vc = KnowledgeCompetitionDifficultyViewController()
        vc.delegate = self
        if let sheet = vc.sheetPresentationController {
            sheet.detents = [.medium(), .large()]
            sheet.prefersGrabberVisible = false
            sheet.prefersScrollingExpandsWhenScrolledToEdge = false
            sheet.largestUndimmedDetentIdentifier = .medium
        }
        
        present(vc, animated: true)
    }
    
    @objc func clickedCreatedButton() {
        guard let knowledgeComptition = knowLedgeCompetitionView.knowledgeCompetitionTextView.text else { return }
        guard let languages = knowLedgeCompetitionView.dropDownButton.titleLabel?.text else { return }
        guard let difficulty = knowLedgeCompetitionView.difficultyButton.titleLabel?.text else { return }
        let systemContent = "SANA VERİLEN HER HANGİ BİR KONUDA BİLGİ YARIŞMASI KONSEPTİNDE SORULARI VE CEVAPLARI SÖYLE"
        print(languages)
        self.knowLedgeCompetitionView.showLoading(text: "", type: .activityIndicator, interaction: false)
        DispatchQueue.main.asyncAfter(deadline: .now() + 4) {
            self.knowLedgeViewModel.sendExplainPromptText(knowledgeComptition: knowledgeComptition, languages: languages, systemContent: systemContent, difficulty: difficulty) { response in
                self.knowLedgeCompetitionView.removeLoading()
                if let responseText = response {
                    self.navigateToChatView(with: knowledgeComptition, response: responseText, languages: languages, systemContent: systemContent)
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
    
    func checkRemainingChars() {
        let allowedChars = 0
        let charsIntextView = (knowLedgeCompetitionView.knowledgeCompetitionTextView.text.count)
        let remainingChars = allowedChars + charsIntextView
        knowLedgeCompetitionView.charcterLimitTitleLabel.text = String(remainingChars)
        
    }
}

//MARK: - AskChoseLanguagesViewControllerProtocol
extension KnowledgeCompetitionViewController: KnowledgeCompetitionLanguagesViewControllerProtocol {
    func didSelectLanguage(language: String) {
        knowLedgeCompetitionView.dropDownButton.setTitle(language, for: .normal)
    }
}

//MARK: - KnowledgeCompetitionDifficultyViewControllerProtocol
extension KnowledgeCompetitionViewController: KnowledgeCompetitionDifficultyViewControllerProtocol {
    func didSelectDifficulty(difficulty: String) {
        knowLedgeCompetitionView.difficultyButton.setTitle(difficulty, for: .normal)
    }
    
    
}

//MARK: - UITextViewDelegate
extension KnowledgeCompetitionViewController: UITextViewDelegate {
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
