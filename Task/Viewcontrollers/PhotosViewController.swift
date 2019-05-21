//
//  PhotosViewController.swift
//  Task
//
//  Created by mhmdraziq on 5/19/19.
//  Copyright © 2019 mhmdraziq. All rights reserved.
//

import UIKit

class PhotosViewController: UIViewController {
    private enum ReusableIdentifiers: String {
        case kHeaderView = "GallarySectionCollectionReusableView"
        case kCell = "imageCell"
    }
    
    @IBOutlet weak var gallaryCollectionView: UICollectionView!
    
    private var albums: [Album] = []
    
    let albumsService = AlbumsService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        gallaryCollectionView.delegate = self
        gallaryCollectionView.dataSource = self
        
        albumsService.fetchAlbums { result in
            switch result {
            case .success(let albums): self.albums = albums
            case .failure: self.albums.removeAll()
            }
            OperationQueue.main.addOperation {
                self.gallaryCollectionView.reloadData()
            }
        }
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        gallaryCollectionView.collectionViewLayout.invalidateLayout()
    }
}

extension PhotosViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        guard let reusableView = collectionView.dequeueReusableSupplementaryView(ofKind: kind,
                                                                           withReuseIdentifier: ReusableIdentifiers.kHeaderView.rawValue,
                                                                           for: indexPath) as? GallarySectionCollectionReusableView
        else {
            return UICollectionReusableView(frame: CGRect.zero)
        }
        reusableView.title = String("Album name <\(albums[indexPath.section].id)>")
        return reusableView
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return albums.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return albums[section].photos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ReusableIdentifiers.kCell.rawValue,
                                                      for: indexPath)
        return cell
    }
}

extension PhotosViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        print(#function, indexPath)
        let photo = albums[indexPath.section].photos[indexPath.row]
        albumsService.fetchImage(photo: photo, completion: { result in
            if case let .success(image) = result {
                // [FIXME]: here uncorrect cell cellection. better use photo albumud & photo id
                // let cell = collectionView.cellForItem(at: IndexPath(row: photo.id!, section: photo.albumId!))
                guard let photoCell = cell as? PhotoCollectionViewCell else {
                    print("can't convert cell to PhotoCollectionViewCell")
                    return
                }
                photoCell.updateContent(with: image, title: photo.title)
            }
        })
    }
}

extension PhotosViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let kMinSpaceBetweenCells: CGFloat = 10
        let itemWidth = (min(collectionView.bounds.size.width, collectionView.bounds.size.height) - kMinSpaceBetweenCells * 2)/2.0
        return CGSize(width: itemWidth, height: itemWidth)
    }
}
