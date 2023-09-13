//
//  PostsListItemModel.swift
//  Task1
//
//  Created by Ivan Suntsov on 9/12/23.
//

import Foundation

class PostsListItemModel: SerializableModel {
    var userId: Int?
    var id: Int?
    var title: String?
    var body: String?

    required init(withJsonObject json:Any) {
        if let dict = json as? Dictionary<String, Any> {
            if let userId = dict["userId"] as? Int,
               let id = dict["id"] as? Int,
               let title = dict["title"] as? String,
               let body = dict["body"] as? String {
                self.userId = userId
                self.id = id
                self.title = title
                self.body = body
            }
        }
    }
}
