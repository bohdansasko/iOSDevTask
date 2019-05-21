//
//  GallarySectionCollectionReusableView.swift
//  Task
//
//  Created by mhmdraziq on 5/21/19.
//  Copyright © 2019 mhmdraziq. All rights reserved.
//

import UIKit

class GallarySectionCollectionReusableView: UICollectionReusableView {
    
    @IBOutlet weak var sectionTitleLable:UILabel!
    
    var sectionTitle:String! {
        didSet {
            sectionTitleLable.text = sectionTitle
        }
    }
        
}
