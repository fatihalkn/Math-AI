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
                                                      .init(title: "Açıkla", type: .explain, subTitle: "Konu başlıkları sağlayarak karmaşık konuları daha kolay anlaşılır hale getirebilirsiniz.", image: .subjectExplain, iconBackroundColor: .gr, handler: {
                                                          //
                                                      }),
                                                      .init(title: "Bilgi Yarışması", type: .knowledgeCompetition, subTitle: "İstediğiniz herhangi bir konuda bir bilgi yarışması başlatın.", image: .subjectTrivia, iconBackroundColor: .gr, handler: {
                                                      })
        ]))
        
        //MARK: - Taslak
        topics.append(Topics(title: "Taslak", topics: [.init(title: "Deneme", type: .attempt, subTitle: "Belirttiğiniz konu başlığında ve istediğiniz deneme türünde bir deneme oluşturabilirsiniz.", image: .subjectEssay, iconBackroundColor: .gr, handler: {
            //
        }),
                                                       .init(title: "Şiir", type: .poem, subTitle: "Çeşitli konularda ve tarzlarda özel şiirler oluşturabilirsiniz.", image: .subjectPoem, iconBackroundColor: .gr, handler: {
                                                           //
                                                       }),
                                                       .init(title: "Blog", type: .blog, subTitle: "Seçtiğiniz konuda bir blog yazabilirsiniz.", image: .subjectBlog, iconBackroundColor: .gr, handler: {
                                                           //
                                                       }),
                                                       .init(title: "Paragraf", type: .paragraph, subTitle: "Herhangi bir konuda iyi yazılmış paragraf oluşturun.", image: .subjectWriteParagraph, iconBackroundColor: .gr, handler: {
                                                           //
                                                       }),
                                                       .init(title: "Şarkı sözleri", type: .lyrics, subTitle: "Herhangi bir müzik tarzı için şarkı sözleri oluşturun.", image: .subjectLyrics, iconBackroundColor: .gr, handler: {
                                                           //
                                                       }),
                                                       .init(title: "Hikaye", type: .stroy, subTitle: "Belirli bir konuya dayalı bir hikaye oluşturun", image: .subjectStory, iconBackroundColor: .gr, handler: {
                                                           //
                                                       })
                                                      ]))
        
        //MARK: - Kod
        topics.append(Topics(title: "Kod", topics: [.init(title: "Kod Yaz", type: .writeCode, subTitle: "Çeşitli programlama dillerinde basit web sayfaları ve uygulamaları yaz.", image: .subjectWriteCode, iconBackroundColor: .gr, handler: {
            
        }),
                                                    .init(title: "Kodu Açıkla", type: .explaneCode, subTitle: "Karmaşık bir kod parçasını açıkla.", image: .subjectExplainCode, iconBackroundColor: .gr, handler: {
                                                        //
                                                    }),
                                                    .init(title: "Kodu Kontrol et", type: .checkCode, subTitle: "Kodunuzu kontrol edin.", image: .iconsMathSolver11, iconBackroundColor: .gr, handler: {
                                                        //
                                                    }),
                                                    .init(title: "Kodu Optimize Et", type: .optimizeCode, subTitle: "Kodunuzu optimize edin.", image: .iconsMathSolver12, iconBackroundColor: .gr, handler: {
                                                        //
                                                    })
                                                   ]))
        
        
        //MARK: - E-Posta
        topics.append(Topics(title: "E-Posta", topics: [.init(title: "E-Posta Yaz", type: .writeEmail, subTitle: "Uyumlu bir Yapıya Sahip iyi tasarlanmış bir e-posta taslağı yaz", image: .subjectWriteEmail, iconBackroundColor: .gr, handler: {
            //
        }),
                                                        .init(title: "E-Posta Konusu Yaz", type: .emailSubject, subTitle: "İnsanları e-postalarınızı açmaya zorlamak için en iyi -posta konu satırlarını oluşturun.", image: .subjectEmailSubject, iconBackroundColor: .gr, handler: {
                                                            //
                                                        }),
                                                        .init(title: "E-postayı Geliştir", type: .ımproveEmail, subTitle: "E-postalarınızın okunabilirliğini ve etkililiğini artırın.", image: .subjectImproveEmail, iconBackroundColor: .gr, handler: {
                                                            //
                                                        })
                                                       ]))
        
        //MARK: - Geliştir
        topics.append(Topics(title: "Geliştir", topics: [.init(title: "Basitleştir", type: .simplify, subTitle: "Karmaşık metinleri basitleştirebilir ve anlamalarını kolaylaştır.", image: .subjectSimplify, iconBackroundColor: .gr, handler: {
            //
        }),
                                                         .init(title: "Geliştir", type: .improve, subTitle: "Gelişmiş parametreleri kullanarak metinin anlamını iyileştir.", image: .subjectImprove, iconBackroundColor: .gr, handler: {
                                                             //
                                                         }),
                                                         .init(title: "Yazmaya Devam Et", type: .keepWriting, subTitle: "Bitmemiş metni veya devam etmek istediğiniz metni yazmaya devam edebilirsiniz.", image: .subjectContinueWriting, iconBackroundColor: .gr, handler: {
                                                             //
                                                         }),
                                                         .init(title: "Kısalt", type: .shorten, subTitle: "Uzun metinleri kısaltarak anlam ve tutarlılığı kaybetmeden kısaltabilirsiniz.", image: .subjectShorten, iconBackroundColor: .gr, handler: {
                                                             //
                                                         })
                                                        ]))
        
        
        //MARK: - Dil
        topics.append(Topics(title: "Dil", topics: [.init(title: "Gramer", type: .grammar, subTitle: "Gramer kontrolü yapabilir ve herhangi bir eksikliği nasıl gidereceğinizi öğrenebilirsiniz.", image: .subjectGrammar, iconBackroundColor: .gr, handler: {
            //
        }),
                                                    .init(title: "Çevir", type: .translate, subTitle: "Kameranızla herhangi bir metni yakalayabilir ve istediğiniz dile anında çevirebilirsiniz", image: .iconsMathSolver2, iconBackroundColor: .gr, handler: {
                                                        //
                                                    })
                                                   ]))
        
        
        //MARK: - Özetle
        topics.append(Topics(title: "Özetle", topics: [.init(title: "Metini Özetle", type: .summarizeText, subTitle: "Seçtiğiniz metnin özetini oluşturabilirsiniz.", image: .subjectSummarizeText, iconBackroundColor: .gr, handler: {
            //
        }),
                                                       .init(title: "Kitabı Özetle", type: .summarizeBook, subTitle: "Kitabın başlığını girerek kitabın özetini oluşturabilirsiniz.", image: .subjectBookSummarize, iconBackroundColor: .gr, handler: {
                                                           //
                                                       }),
                                                       .init(title: "Anahtar Kelimeleri Çıkar", type: .extractKeywords, subTitle: "Metinden anahtar kelimeler çıkarabilirsiniz.", image: .subjectExtractKeywords, iconBackroundColor: .gr, handler: {
                                                           //
                                                       })
                                                      ]))
    }
}
