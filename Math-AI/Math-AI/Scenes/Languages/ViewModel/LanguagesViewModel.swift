//
//  LanguagesViewModel.swift
//  Math-AI
//
//  Created by Fatih on 11.06.2024.
//

import Foundation

class LanguagesViewModel {
    
    var languages: [LanguagesModel] = []
    
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
        
        languages = languagesArray.map({LanguagesModel(languags: $0)})
    }
    
    
    
    
}
