//
//  PhotoCollectionViewCell.swift
//  
//
//  Created by mhmdraziq on 5/21/19.
//

import UIKit

class PhotoCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var galleryImage: UIImageView!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var activity: UIActivityIndicatorView!
    
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
        if image == nil {
            activity.startAnimating()
        } else {
            activity.stopAnimating()
        }
        galleryImage.image = image
        descriptionLabel.text = title
    }
}
