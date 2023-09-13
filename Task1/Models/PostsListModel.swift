//
//  PostsListModel.swift
//  Task1
//
//  Created by Ivan Suntsov on 9/12/23.
//

import Foundation

class PostsListModel: SerializableModel {
    var posts = [PostsListItemModel]()
    required init(withJsonObject json:Any) {
        if let array = json as? Array<Any> {
            array.forEach { object in
                posts.append(PostsListItemModel(withJsonObject: object))
            }
        }
    }
}
