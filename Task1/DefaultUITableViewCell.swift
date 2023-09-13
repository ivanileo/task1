//
//  DefaultUITableViewCell.swift
//  Task1
//
//  Created by Ivan Suntsov on 9/12/23.
//

import Foundation
import UIKit

class DefaultUITableViewCell: UITableViewCell {
    let primaryLabel = UILabel()
    let secondaryLabel = UILabel()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.buildLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func loadData(primaryText: String?, secondaryText: String?) {
        primaryLabel.text = primaryText
        secondaryLabel.text = secondaryText
    }
    
    func buildLayout() {
        self.heightAnchor.constraint(equalToConstant: 150).isActive = true
        primaryLabel.translatesAutoresizingMaskIntoConstraints = false
        secondaryLabel.translatesAutoresizingMaskIntoConstraints = false
        primaryLabel.font = .systemFont(ofSize: 25)
        secondaryLabel.font = .systemFont(ofSize: 15)
        primaryLabel.lineBreakMode = .byTruncatingTail
        primaryLabel.numberOfLines = .max
        secondaryLabel.lineBreakMode = .byTruncatingTail
        secondaryLabel.numberOfLines = .max
        self.addSubview(primaryLabel)
        self.addSubview(secondaryLabel)

        primaryLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 8).isActive = true
        primaryLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -8).isActive = true
        primaryLabel.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        primaryLabel.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        secondaryLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 8).isActive = true
        secondaryLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -8).isActive = true
        secondaryLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        secondaryLabel.heightAnchor.constraint(equalToConstant: 110).isActive = true

    }
}
