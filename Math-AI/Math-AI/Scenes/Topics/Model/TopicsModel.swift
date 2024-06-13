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
    let subTitle: String
    let image: UIImage
    let iconBackroundColor: UIColor
    let handler: (() -> Void)
}

struct Topics {
    let title: String
    let topics: [SubjectItem]
}

