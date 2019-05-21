//
//  Address.swift
//  Task
//
//  Created by mhmdraziq on 5/21/19.
//  Copyright © 2019 mhmdraziq. All rights reserved.
//

import Foundation
import UIKit

class AddressComponent: UIView {
    @IBOutlet weak var street: UILabel!
    @IBOutlet weak var suite: UILabel!
    @IBOutlet weak var city: UILabel!
    @IBOutlet weak var zipCode: UILabel!
    @IBOutlet weak var lat: UILabel!
    @IBOutlet weak var lng: UILabel!
    
    var AddressObj: Address!
    
    func Init(add: Address,view: UIView){
        self.street.text = add.street
        self.suite.text = add.suite
        self.city.text = add.city
        self.zipCode.text = add.zipcode
        self.lat.text = add.geo?.lat
        self.lng.text = add.geo?.lng
        self.bounds = view.bounds
        
        view.addSubview(self)
    }
    
}
