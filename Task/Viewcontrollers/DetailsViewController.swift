//
//  DetailsViewController.swift
//  Task
//
//  Created by mhmdraziq on 5/19/19.
//  Copyright © 2019 mhmdraziq. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {
    
    var userObj: User!
    
    @IBOutlet weak var companyHolderView: UIView!
    @IBOutlet weak var addressHolderView: UIView!
    @IBOutlet weak var detailsView: UIView!
    
    @IBOutlet weak var website: UILabel!
    @IBOutlet weak var phone: UILabel!
    @IBOutlet weak var email: UILabel!
    @IBOutlet weak var username: UILabel!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var id: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if (userObj != nil ) {
            fillDetails()
            settingUPComponents()
        }
        
        applyCardView(myView:companyHolderView)
        applyCardView(myView:addressHolderView)
    }
    
    func fillDetails(){
        website.text = userObj.website
        phone.text = userObj.phone
        email.text = userObj.email
        username.text = userObj.username
        name.text = userObj.name
        id.text = String(userObj.id!)
    }
    
    func settingUPComponents(){
        
        //setting up address view
        let AddressView = Bundle.main.loadNibNamed("Address",
                                                   owner: nil,
                                                   options: nil)?.first as? AddressComponent
        AddressView?.Init(add: userObj.address!,view: addressHolderView)
        //setting up company view
        let CompanyView = Bundle.main.loadNibNamed("CompanyComponent",
                                                   owner: nil,
                                                   options: nil)?.first as? CompanyComponent
        CompanyView?.Init(comp: userObj!.company!,view: companyHolderView)
        
    }
    
    func applyCardView(myView:UIView){
        myView.layer.shadowColor = UIColor.gray.cgColor
        myView.layer.shadowOffset = CGSize(width: 0.0, height: 0.0)
        myView.layer.shadowRadius = 4.0
        myView.layer.shadowOpacity = 0.5
    }
    
}
