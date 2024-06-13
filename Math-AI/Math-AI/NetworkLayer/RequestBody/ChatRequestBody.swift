//
//  ChatRequestBody.swift
//  Math-AI
//
//  Created by Fatih on 13.06.2024.
//

import Foundation

// MARK: - ChatRequestBody
struct ChatRequestBody: Codable {
    let model: String?
    let messages: [Message]?
}

// MARK: - Message
struct Message: Codable {
    let role: SenderRole
    let content: String?
}

enum SenderRole: String, Codable {
    case system
    case user
    case assistant
}
