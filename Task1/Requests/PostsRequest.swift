//
//  PostsRequest.swift
//  Task1
//
//  Created by Ivan Suntsov on 9/12/23.
//

import Foundation

class PostsRequest: NetworkRequest {
    var url = "https://jsonplaceholder.typicode.com"
    
    var path = "/posts"
    
    var query: Dictionary<String, String>? = nil
    
    var headers: Dictionary<String, String>? = nil
    
    var body: Data? = nil
    
    var method: HTTPMethod = .get
    
    var responseType: ResponseType = .posts
}
