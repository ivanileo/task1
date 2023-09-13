//
//  CommentsListModel.swift
//  Task1
//
//  Created by Ivan Suntsov on 9/12/23.
//

import Foundation

class CommentsListModel: SerializableModel {
    var comments = [CommentsListItemModel]()
    required init(withJsonObject json:Any) {
        if let array = json as? Array<Any> {
            array.forEach { object in
                comments.append(CommentsListItemModel(withJsonObject: object))
            }
        }
    }
}
