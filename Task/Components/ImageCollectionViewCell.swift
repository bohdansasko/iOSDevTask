//
//  ImageCollectionViewCell.swift
//  
//
//  Created by mhmdraziq on 5/21/19.
//

import UIKit

class ImageCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var galleryImage: UIImageView!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        galleryImage.layer.cornerRadius = 10
        galleryImage.layer.masksToBounds = true
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        updateContent(with: nil, title: nil)
    }
    
    func updateContent(with image: UIImage?, title: String?) {
        galleryImage.image = image
        descriptionLabel.text = title
    }
}
