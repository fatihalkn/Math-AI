//
//  AskSubjectViewModel.swift
//  Math-AI
//
//  Created by Fatih on 18.06.2024.
//

import Foundation

class AskSubjectViewModel {
    
    var answers: [String] = []
    var languages: [AskSubjectModel] = []
    
    init() {
        let languagesArray = [
                    "Albanian", "Arabic", "Armenian", "Awadhi", "Azerbaijani", "Bashkir", "Basque",
                    "Belarusian", "Bengali", "Bhojpuri", "Bosnian", "Portuguese", "Bulgarian", "Cantonese",
                    "Catalan", "Chhattisgarhi", "Chinese", "Croatian", "Czech", "Danish", "Dogri", "Dutch",
                    "English", "Estonian", "Faroese", "Finnish", "French", "Galician", "Georgian", "German",
                    "Greek", "Gujarati", "Haryanvi", "Hindi", "Hungarian", "Indonesian", "Irish", "Italian",
                    "Japanese", "Javanese", "Kannada", "Kashmiri", "Kazakh", "Konkani", "Korean", "Kyrgyz",
                    "Latvian", "Lithuanian", "Macedonian", "Maithili", "Malay", "Maltese", "Mandarin",
                    "Mandarin Chinese", "Marathi", "Marwari", "Min Nan", "Moldovan", "Mongolian", "Montenegrin",
                    "Nepali", "Norwegian", "Oriya", "Pashto", "Persian", "Polish", "Portuguese", "Punjabi",
                    "Rajasthani", "Romanian", "Russian", "Sanskrit", "Santali", "Serbian", "Sindhi", "Sinhala",
                    "Slovak", "Slovene", "Slovenian", "Spanish", "Swahili", "Swedish", "Tajik", "Tamil",
                    "Tatar", "Telugu", "Thai", "Turkish", "Turkmen", "Ukrainian", "Urdu", "Uzbek", "Vietnamese",
                    "Welsh", "Wu"
                ]
        
        languages = languagesArray.map({AskSubjectModel(languags: $0)})
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
                    self.answers = choices.compactMap({$0.message?.content})
                    completion(firstChose.message?.content)
                    print(firstChose.message?.content ?? "")
                }
            case .failure(let failure):
                completion(nil)
                print("İSTEK BAŞARISIZ \(failure)")
            }
        }
    }
}
