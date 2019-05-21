//
//  GallerySectionCollectionReusableView.swift
//  Task
//
//  Created by mhmdraziq on 5/21/19.
//  Copyright © 2019 mhmdraziq. All rights reserved.
//

import UIKit

class GallerySectionCollectionReusableView: UICollectionReusableView {
    @IBOutlet weak var sectionTitleLable: UILabel!
    
    var title: String? {
        didSet {
            sectionTitleLable.text = title
        }
    }
        
}
