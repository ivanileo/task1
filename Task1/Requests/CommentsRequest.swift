//
//  CommentsRequest.swift
//  Task1
//
//  Created by Ivan Suntsov on 9/12/23.
//

import Foundation

class CommentsRequest: NetworkRequest {
    var postId: Int

    var url = "https://jsonplaceholder.typicode.com"
    
    var path = "/comments"
    
    var query: Dictionary<String, String>? {
        get {
            ["postId" : String(postId)]
        }
        set { }
    }
    
    var headers: Dictionary<String, String>? = nil
    
    var body: Data? = nil
    
    var method: HTTPMethod = .get
    
    var responseType: ResponseType = .comments

    init(postId: Int) {
        self.postId = postId
    }
}
