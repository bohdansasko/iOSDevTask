//
//  ImageCollectionViewCell.swift
//  
//
//  Created by mhmdraziq on 5/21/19.
//

import UIKit

class ImageCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var gallaryImage: UIImageView!
    @IBOutlet weak var descreption: UILabel!
    
    override func prepareForReuse() {
        super.prepareForReuse()
        updateContent(with: nil, title: nil)
    }
    
    func updateContent(with image: UIImage?, title: String?) {
        gallaryImage.image = image
        descreption.text = title
    }
}
