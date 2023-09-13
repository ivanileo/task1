//
//  SerializableModel.swift
//  Task1
//
//  Created by Ivan Suntsov on 9/12/23.
//

import Foundation

protocol SerializableModel {
    init(withJsonObject json:Any)
}
