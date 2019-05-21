//
//  CompanyComponent.swift
//  Task
//
//  Created by mhmdraziq on 5/21/19.
//  Copyright © 2019 mhmdraziq. All rights reserved.
//

import UIKit

class CompanyComponent: UIView {
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var bs: UILabel!
    @IBOutlet weak var catchPhrase: UILabel!
    
    var companyObj: Company!                 // - MARK: I haven't seen ussage of this variable
                                             // - MARK: in this case using of '!' isn't good cause I don't see initialising
    
    func Init(comp: Company, view: UIView) { // - MARK: view -> should be parentView or something similar
        self.name.text = comp.name
        self.bs.text = comp.bs
        self.catchPhrase.text = comp.catchPhrase
        
        self.bounds = view.bounds
        view.addSubview(self)
    }
}
