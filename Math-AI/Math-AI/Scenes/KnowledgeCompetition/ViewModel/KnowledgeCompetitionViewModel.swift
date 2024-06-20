//
//  KnowledgeCompetitionViewModel.swift
//  Math-AI
//
//  Created by Fatih on 20.06.2024.
//

import Foundation

class KnowledgeCompetitionViewModel {
    
    var knowledgeComptitionAnswer: [String] = []
    var languages: [KnowledgeCompetitionLanguagesModel] = []
    var difficultyChoice: [KnowledgeCompetitionDifficultyModel] = [.init(difficulty: "Orta"),
                                                         .init(difficulty: "Başlangıç"),
                                                         .init(difficulty: "Uzman")]
    
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
        
        languages = languagesArray.map({KnowledgeCompetitionLanguagesModel(languages: $0)})
    }
    
    
    func sendExplainPromptText(knowledgeComptition: String, languages: String, systemContent: String, difficulty: String, complation: @escaping (String?) -> (Void)) {
        let model = "gpt-3.5-turbo"
        let message = [
            Message(role: .system, content: systemContent),
            Message(role: .user, content: "BİLGİ YARIŞMASININ KONUSU: \(knowledgeComptition), BİLGİ YARIŞMASININ DİLİ: \(languages), ZORLUK DERECESİ: \(difficulty)")
        ]
        
        NetworkService.shared.sendChatRequest(model: model, messages: message) { (response: Result<ChatResponseModel, Error>) in
            switch response {
            case .success(let success):
                if let choise = success.choices, let firstChose = choise.first {
                    self.knowledgeComptitionAnswer = choise.compactMap({$0.message?.content})
                    complation(firstChose.message?.content)
                }
            case .failure(let failure):
                complation(nil)
                print("İSTEK BAŞARISIZ \(failure)")
            }
        }
    }
}
