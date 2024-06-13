//
//  NetworkService.swift
//  Math-AI
//
//  Created by Fatih on 13.06.2024.
//

import Foundation
import Alamofire

class NetworkService {
    static let shared = NetworkService()

    private let baseURL = URL(string: NetworkConstants.chatBaseUrl)!
    private let headers: HTTPHeaders = [
        "Authorization": "Bearer \(NetworkConstants.chatAPIKey)",
        "Content-Type": "application/json"
    ]
    
    func sendChatRequest<T: Decodable>(model: String, messages: [Message], completion: @escaping (Result<T, Error>) -> Void) {
        
        let requestBody = ChatRequestBody(model: model, messages: messages)
        
        AF.request(baseURL,method: .post,parameters: requestBody, encoder: JSONParameterEncoder.default, headers: headers).validate(statusCode: 200..<300).responseDecodable(of: T.self) { response in
            switch response.result {
            case .success(let chatResponse):
                completion(.success(chatResponse))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}

