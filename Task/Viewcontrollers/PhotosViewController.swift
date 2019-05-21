//
//  PhotosViewController.swift
//  Task
//
//  Created by mhmdraziq on 5/19/19.
//  Copyright © 2019 mhmdraziq. All rights reserved.
//

import UIKit

class PhotosViewController: UIViewController , UICollectionViewDelegate , UICollectionViewDataSource , UICollectionViewDelegateFlowLayout {
  

    @IBOutlet weak var gallaryCollectionView: UICollectionView!
    
    struct statics {
        static let sectionHeaderView = "GallarySectionCollectionReusableView"
        static let imageCell = "imageCell"
    }
    var images:[Photo] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        gallaryCollectionView.delegate = self
        gallaryCollectionView.dataSource = self
        
        
    }
    override func viewDidAppear(_ animated: Bool) {
        let imagesService = PhotosService()
//        imagesService.getImages(){
//            images in
//            self.images = images
//            
//            let maxAlbumId = images.map{$0.albumId}.max()
//            for item in self.images{
//                
//                let albumId = item.albumId
//                
//                if(
//            }
//
//        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
      return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: statics.imageCell, for: indexPath) as? ImageCollectionViewCell
        
//        let photoSection = self.images[indexPath.row].albumId
//        let imageUrl =
        return cell!
    }
    

}
