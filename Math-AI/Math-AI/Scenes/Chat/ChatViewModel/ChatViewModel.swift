//
//  AskChatViewModel.swift
//  Math-AI
//
//  Created by Fatih on 19.06.2024.
//

import Foundation

class ChatViewModel {
    var answers: [String] = []
    
    func addChatMessage(_ message: String) {
        answers.append(message)
    }
    
    
    func sendAskPromtText(ask: String, languages: String, systemContent: String,completion: @escaping (String?) -> Void) {
        let model = "gpt-3.5-turbo"
        let message = [
            Message(role: .system, content: systemContent),
            Message(role: .user, content: "SORU: \(ask) DİL: \(languages)")
        ]
    
        NetworkService.shared.sendChatRequest(model: model, messages: message) { (response: Result< ChatResponseModel, Error>) in
            switch response {
            case .success(let success):
                if let choices = success.choices, let firstChose = choices.first {
                    if let content = firstChose.message?.content {
                        completion(firstChose.message?.content)
                        print(firstChose.message?.content ?? "")
                    }
                }
            case .failure(let failure):
                completion(nil)
                print("İSTEK BAŞARISIZ \(failure)")
            }
        }
    }
    
}
