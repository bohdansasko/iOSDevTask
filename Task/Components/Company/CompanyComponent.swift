//
//  CompanyComponent.swift
//  Task
//
//  Created by mhmdraziq on 5/21/19.
//  Copyright © 2019 mhmdraziq. All rights reserved.
//

import Foundation


import Foundation
import UIKit
class CompanyComponent:UIView {
    
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var bs: UILabel!
    @IBOutlet weak var CatchPhrase: UILabel!
    var CompanyObj:Company!
    
    func Init(comp:Company,view:UIView){
        self.name.text = comp.name
        self.bs.text = comp.bs
        self.CatchPhrase.text = comp.catchPhrase
        self.bounds = view.bounds
        view.addSubview(self)
       
    }
    
}
