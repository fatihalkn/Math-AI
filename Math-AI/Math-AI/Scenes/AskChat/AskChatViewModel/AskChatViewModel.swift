//
//  AskChatViewModel.swift
//  Math-AI
//
//  Created by Fatih on 19.06.2024.
//

import Foundation

class AskChatViewModel {
    var answers: [String] = []
    
    func addChatMessage(_ message: String) {
        answers.append(message)
        }
    
    func sendAskPromtText(ask: String, languages: String) {
        let model = "gpt-3.5-turbo"
        let message = [
            Message(role: .assistant, content: "SORU: \(ask) DİL: \(languages) ")
        ]
        
        NetworkService.shared.sendChatRequest(model: model, messages: message) { (response: Result< ChatResponseModel, Error>) in
            switch response {
            case .success(let success):
                if let choices = success.choices {
                    self.answers = choices.compactMap({$0.message?.content})
                }
            case .failure(let failure):
                print("İSTEK BAŞARISIZ \(failure)")
            }
        }
    }
}
