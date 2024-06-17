//
//  TopicsModel.swift
//  Math-AI
//
//  Created by Fatih on 13.06.2024.
//

import Foundation
import UIKit


struct SubjectItem {
    let title: String
    var type: SubjectItemType
    let subTitle: String
    let image: UIImage
    let iconBackroundColor: UIColor
    let handler: (() -> Void)
}

struct Topics {
    let title: String
    let topics: [SubjectItem]
}

enum SubjectItemType: String {
    case ask
    case explain
    case knowledgeCompetition
    case attempt
    case poem
    case blog
    case paragraph
    case lyrics
    case stroy
    case writeCode
    case checkCode
    case optimizeCode
    case explaneCode
    case writeEmail
    case emailSubject
    case ımproveEmail
    case simplify
    case improve
    case keepWriting
    case shorten
    case grammar
    case translate
    case summarizeText
    case summarizeBook
    case extractKeywords
}
