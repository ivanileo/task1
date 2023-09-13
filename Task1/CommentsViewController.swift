//
//  CommentsViewController.swift
//  Task1
//
//  Created by Ivan Suntsov on 9/12/23.
//

import Foundation
import UIKit

class CommentsViewController: UIViewController, UITableViewDataSource {
    var postId: Int?
    var fetchedData: CommentsListModel?
    var tableView: UITableView?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemBackground
        self.title = "Comments"
        self.buildView()
        self.fetchData()
    }

    func fetchData() {
        if let postId = self.postId {
            NetworkManager.sendRequest(CommentsRequest(postId: postId)) { model, error in
                if let fetchedData = model as? CommentsListModel {
                    self.fetchedData = fetchedData
                    DispatchQueue.main.async {
                        self.tableView?.reloadData()
                    }
                }
            }
        }
    }

    func buildView() {
        let tableView = UITableView()
        tableView.dataSource = self
        tableView.backgroundColor = .systemBackground
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(DefaultUITableViewCell.self, forCellReuseIdentifier: "DefaultCell")
        self.view.addSubview(tableView)
        tableView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        tableView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        self.tableView = tableView
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fetchedData?.comments.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DefaultCell", for: indexPath)
        if let defaultCell = cell as? DefaultUITableViewCell {
            defaultCell.loadData(primaryText: self.fetchedData?.comments[indexPath.item].name,
                                 secondaryText: self.fetchedData?.comments[indexPath.item].body)
        }
        return cell
    }
}
