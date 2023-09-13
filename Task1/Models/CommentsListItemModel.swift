//
//  CommentsListItemModel.swift
//  Task1
//
//  Created by Ivan Suntsov on 9/12/23.
//

import Foundation

class CommentsListItemModel: SerializableModel {
    var postId: Int?
    var id: Int?
    var name: String?
    var email: String?
    var body: String?

    required init(withJsonObject json:Any) {
        if let dict = json as? Dictionary<String, Any> {
            if let postId = dict["postId"] as? Int,
               let id = dict["id"] as? Int,
               let name = dict["name"] as? String,
               let email = dict["email"] as? String,
               let body = dict["body"] as? String {
                self.postId = postId
                self.id = id
                self.name = name
                self.email = email
                self.body = body
            }
        }
    }
}
