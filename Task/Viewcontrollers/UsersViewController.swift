//
//  UsersViewController.swift
//  Task
//
//  Created by mhmdraziq on 5/19/19.
//  Copyright © 2019 mhmdraziq. All rights reserved.
//

import UIKit

class UsersViewController: UIViewController {
    @IBOutlet weak var usersTable: UITableView!
    
    var users: [User] = []
    var userService: UserService = UserService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        usersTable.delegate = self
        usersTable.dataSource = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        userService.getUsers() { users in
            self.users = users
            OperationQueue.main.addOperation {
                self.usersTable.reloadData()
            }
        }
    }
}

extension UsersViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "userCell") else {
            return UITableViewCell()
        }
        return cell
    }
}

extension UsersViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        guard let userCell = cell as? UserTableViewCell else {
            return
        }
        userCell.update(with: users[indexPath.row])
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let detailsViewController = storyBoard.instantiateViewController(withIdentifier: "DetailsViewController") as! DetailsViewController
        detailsViewController.userObj = self.users[indexPath.row]
        navigationController?.pushViewController(detailsViewController, animated: true)
    }
}

