//
//  UsersViewController.swift
//  Task
//
//  Created by mhmdraziq on 5/19/19.
//  Copyright © 2019 mhmdraziq. All rights reserved.
//

import UIKit

class UsersViewController: UIViewController , UITableViewDelegate , UITableViewDataSource {
    
    var users:[User] = []
    var userService:UserService = UserService()
    @IBOutlet weak var usersTable: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
    
        usersTable.delegate = self
        usersTable.dataSource = self
     
    }
    override func viewDidAppear(_ animated: Bool) {
        userService.getUsers(){
             users in
            self.users = users
            self.usersTable.reloadData()
        }
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier:"userCell") as? UserTableViewCell
        cell!.name.text = users[indexPath.row].name ?? ""
        cell!.email.text = users[indexPath.row].email ?? ""
        return cell!
        
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let detailsViewController = storyBoard.instantiateViewController(withIdentifier: "DetailsViewController") as! DetailsViewController
        detailsViewController.userObj = self.users[indexPath.row]
        navigationController?.pushViewController(detailsViewController, animated: true)
    }
}
