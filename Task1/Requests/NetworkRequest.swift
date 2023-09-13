//
//  NetworkRequest.swift
//  Task1
//
//  Created by Ivan Suntsov on 9/12/23.
//

import Foundation

enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case delete = "DELETE"
}

enum ResponseType {
    case posts
    case comments
    
    func serialise(json: Any) -> SerializableModel {
        switch self {
        case .posts:
            return PostsListModel(withJsonObject: json)
        case .comments:
            return CommentsListModel(withJsonObject: json)
        }
        
    }
}

protocol NetworkRequest {
    var url: String { get set }
    var path: String { get set }
    var query: Dictionary<String, String>? { get set }
    var headers: Dictionary<String, String>? { get set }
    var body: Data? { get set }
    var method: HTTPMethod { get set }
    var responseType: ResponseType { get set }
}
