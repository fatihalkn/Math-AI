//
//  ChatResponseModel.swift
//  Math-AI
//
//  Created by Fatih on 13.06.2024.
//
import Foundation

// MARK: - OpenAIChatResponse
struct ChatResponseModel: Codable {
    let id, object: String?
    let created: Int?
    let model: String?
    let choices: [Choice]?
    let usage: Usage?
}

// MARK: - Choice
struct Choice: Codable {
    let index: Int?
    let message: ResponseMessage?
    let finishReason: String?

    enum CodingKeys: String, CodingKey {
        case index, message
        case finishReason = "finish_reason"
    }
}

// MARK: - ResponseMessage
struct ResponseMessage: Codable {
    let role, content: String?
}

// MARK: - Usage
struct Usage: Codable {
    let promptTokens, completionTokens, totalTokens: Int?

    enum CodingKeys: String, CodingKey {
        case promptTokens = "prompt_tokens"
        case completionTokens = "completion_tokens"
        case totalTokens = "total_tokens"
    }
}
