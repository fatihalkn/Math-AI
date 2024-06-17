//
//  TopicsViewModel.swift
//  Math-AI
//
//  Created by Fatih on 13.06.2024.
//

import Foundation

class TopicsViewModel {
    
    var topics: [Topics] = []
    
    func configureTableViewItems() {
        
        //MARK: - Header
        
        topics.append(Topics.init(title: "", topics: []))
        
        //MARK: - Öğren
        topics.append(Topics(title: "Öğren", topics: [.init(title: "Sor",
                                                            type: .ask, subTitle: "Sormak istedğin herşeyi sorabilirsin.", image: .subjectAsk, iconBackroundColor: .gr, handler: {
            //
        }),
                                                      .init(title: "Açıkla", type: .explain, subTitle: "Sormak istedğin herşeyi sorabilirsin.", image: .subjectExplain, iconBackroundColor: .gr, handler: {
                                                          //
                                                      }),
                                                      .init(title: "Bilgi Yarışması", type: .knowledgeCompetition, subTitle: "Sormak istedğin herşeyi sorabilirsin.", image: .subjectTrivia, iconBackroundColor: .gr, handler: {
                                                      })
        ]))
        
        //MARK: - Taslak
        topics.append(Topics(title: "Taslak", topics: [.init(title: "Deneme", type: .attempt, subTitle: "Belirttiğiniz konu başlığında deneme türü", image: .subjectEssay, iconBackroundColor: .gr, handler: {
            //
        }),
                                                       .init(title: "Şiir", type: .poem, subTitle: "Belirttiğiniz konu başlığında deneme türü", image: .subjectPoem, iconBackroundColor: .gr, handler: {
                                                           //
                                                       }),
                                                       .init(title: "Blog", type: .blog, subTitle: "Belirttiğiniz konu başlığında deneme türü,Belirttiğiniz konu başlığında deneme türü", image: .subjectBlog, iconBackroundColor: .gr, handler: {
                                                           //
                                                       }),
                                                       .init(title: "Paragraf", type: .paragraph, subTitle: "pBelirttiğiniz konu başlığında deneme türü", image: .subjectWriteParagraph, iconBackroundColor: .gr, handler: {
                                                           //
                                                       }),
                                                       .init(title: "Şarkı sözleri", type: .lyrics, subTitle: "Belirttiğiniz konu başlığında deneme türü", image: .subjectLyrics, iconBackroundColor: .gr, handler: {
                                                           //
                                                       }),
                                                       .init(title: "Hikaye", type: .stroy, subTitle: "Belirttiğiniz konu başlığında deneme türü", image: .subjectStory, iconBackroundColor: .gr, handler: {
                                                           //
                                                       })
                                                      ]))
        
        //MARK: - Kod
        topics.append(Topics(title: "Kod", topics: [.init(title: "Kod Yaz", type: .writeCode, subTitle: "Çeşitli Programlama dillerinde basit web sayfaları ve uygulamaları yaz.", image: .subjectWriteCode, iconBackroundColor: .gr, handler: {
            
        }),
                                                    .init(title: "Kodu Açıkla", type: .explaneCode, subTitle: "Programlama dillerinde basit web sayfaları ve uygulamaları yaz.", image: .subjectExplainCode, iconBackroundColor: .gr, handler: {
                                                        //
                                                    }),
                                                    .init(title: "Kodu Kontrol et", type: .checkCode, subTitle: "Programlama dillerinde basit web sayfaları ve uygulamaları yaz.", image: .iconsMathSolver11, iconBackroundColor: .gr, handler: {
                                                        //
                                                    }),
                                                    .init(title: "Kodu Optimize Et", type: .optimizeCode, subTitle: "Programlama dillerinde basit web sayfaları ve uygulamaları yaz.", image: .iconsMathSolver12, iconBackroundColor: .gr, handler: {
                                                        //
                                                    })
                                                   ]))
        
        
        //MARK: - E-Posta
        topics.append(Topics(title: "E-Posta", topics: [.init(title: "E-Posta Yaz", type: .writeEmail, subTitle: "Uyumlu bir Yapıya Sahip iyi tasarlanmış bir e-posta taslağı yaz", image: .subjectWriteEmail, iconBackroundColor: .gr, handler: {
            //
        }),
                                                        .init(title: "E-Posta Konusu Yaz", type: .emailSubject, subTitle: "Uyumlu bir Yapıya Sahip iyi tasarlanmış bir e-posta taslağı yaz", image: .subjectEmailSubject, iconBackroundColor: .gr, handler: {
                                                            //
                                                        }),
                                                        .init(title: "E-postayı Geliştir", type: .ımproveEmail, subTitle: "Uyumlu bir Yapıya Sahip iyi tasarlanmış bir e-posta taslağı yaz", image: .subjectImproveEmail, iconBackroundColor: .gr, handler: {
                                                            //
                                                        })
                                                       ]))
        
        //MARK: - Geliştir
        topics.append(Topics(title: "Geliştir", topics: [.init(title: "Basitleştir", type: .simplify, subTitle: "Karmaşık resimleri basitleştir", image: .subjectSimplify, iconBackroundColor: .gr, handler: {
            //
        }),
                                                         .init(title: "Geliştir", type: .improve, subTitle: "Karmaşık resimleri basitleştir", image: .subjectImprove, iconBackroundColor: .gr, handler: {
                                                             //
                                                         }),
                                                         .init(title: "Yazmaya Devam Et", type: .keepWriting, subTitle: "Karmaşık resimleri basitleştir", image: .subjectContinueWriting, iconBackroundColor: .gr, handler: {
                                                             //
                                                         }),
                                                         .init(title: "Kısalt", type: .shorten, subTitle: "Karmaşık resimleri basitleştir", image: .subjectShorten, iconBackroundColor: .gr, handler: {
                                                             //
                                                         })
                                                        ]))
        
        
        //MARK: - Dil
        topics.append(Topics(title: "Dil", topics: [.init(title: "Gramer", type: .grammar, subTitle: "Gramer kontrolü yapabilir ve herhangi bir eksikliği nasıl giderileceğini öğrenin", image: .subjectGrammar, iconBackroundColor: .gr, handler: {
            //
        }),
                                                    .init(title: "Çevir", type: .translate, subTitle: "Gramer kontrolü yapabilir ve herhangi bir eksikliği nasıl giderileceğini öğrenin", image: .iconsMathSolver2, iconBackroundColor: .gr, handler: {
                                                        //
                                                    })
                                                   ]))
        
        
        //MARK: - Özetle
        topics.append(Topics(title: "Özetle", topics: [.init(title: "Metini Özetle", type: .summarizeText, subTitle: "Seçtiğiniz Metinin özetini oluşturabilirsiniz", image: .subjectSummarizeText, iconBackroundColor: .gr, handler: {
            //
        }),
                                                       .init(title: "Kitabı Özetle", type: .summarizeBook, subTitle: "Kitabın Başlığını Girerek Özetini Oluşturabilirsiniz.", image: .subjectBookSummarize, iconBackroundColor: .gr, handler: {
                                                           //
                                                       }),
                                                       .init(title: "Anahtar Kelimeleri Çıkar", type: .extractKeywords, subTitle: "Metinden anahtar kelimekeri çıkartabilirsiniz", image: .subjectExtractKeywords, iconBackroundColor: .gr, handler: {
                                                           //
                                                       })
                                                      ]))
    }
}
