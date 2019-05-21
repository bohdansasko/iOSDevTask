//
//  UserTableViewCell.swift
//  Task
//
//  Created by mhmdraziq on 5/19/19.
//  Copyright © 2019 mhmdraziq. All rights reserved.
//

import UIKit

class UserTableViewCell: UITableViewCell {
    @IBOutlet weak var email: UILabel!
    @IBOutlet weak var name: UILabel!
    
    override func prepareForReuse() {
        super.prepareForReuse()
        update(with: nil)
    }
    
    func update(with user: User?) {
        name.text = user?.name
        email.text = user?.email
    }
}
