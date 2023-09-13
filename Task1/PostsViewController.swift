//
//  PostsViewController.swift
//  Task1
//
//  Created by Ivan Suntsov on 9/12/23.
//

import Foundation
import UIKit

class PostsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var fetchedData: PostsListModel?
    var tableView: UITableView?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemBackground
        self.title = "Posts"
        self.buildView()
        self.fetchData()
    }

    func fetchData() {
        NetworkManager.sendRequest(PostsRequest()) { model, error in
            if let fetchedData = model as? PostsListModel {
                self.fetchedData = fetchedData
                DispatchQueue.main.async {
                    self.tableView?.reloadData()
                }
            }
        }
    }

    func buildView() {
        let tableView = UITableView()
        tableView.dataSource = self
        tableView.delegate = self
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
        return fetchedData?.posts.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DefaultCell", for: indexPath)
        if let defaultCell = cell as? DefaultUITableViewCell {
            defaultCell.loadData(primaryText: self.fetchedData?.posts[indexPath.item].title, secondaryText: self.fetchedData?.posts[indexPath.item].body)
        }
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let commentsViewController = CommentsViewController()
        commentsViewController.postId = self.fetchedData?.posts[indexPath.item].id
        self.navigationController?.pushViewController(commentsViewController, animated: true)
    }
}
