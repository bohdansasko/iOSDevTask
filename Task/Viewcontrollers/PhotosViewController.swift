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
        case kHeaderView = "GallerySectionCollectionReusableView"
        case kCell = "imageCell"
    }
    
    @IBOutlet weak var galleryCollectionView: UICollectionView!
    
    private var albums: [Album] = []
    
    let albumsService = AlbumsService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        galleryCollectionView.delegate = self
        galleryCollectionView.dataSource = self
        
        updateDataSource()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        galleryCollectionView.collectionViewLayout.invalidateLayout()
    }
    
    func updateDataSource() {
        albumsService.fetchAlbums { result in
            switch result {
            case .success(let albums): self.albums = albums
            case .failure: self.albums.removeAll()
            }
            OperationQueue.main.addOperation {
                self.galleryCollectionView.reloadData()
            }
        }
    }
}

extension PhotosViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        guard let reusableView = collectionView.dequeueReusableSupplementaryView(ofKind: kind,
                                                                           withReuseIdentifier: ReusableIdentifiers.kHeaderView.rawValue,
                                                                           for: indexPath) as? GallerySectionCollectionReusableView
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
                guard
                    let albumIdx = self.albums.lastIndex(where: { $0.id == photo.albumId! }),
                    let row = self.albums[albumIdx].photos.index(of: photo) else {
                        return
                }
                let photoIndexPath = IndexPath(row: row, section: albumIdx)
                print("photoIndexPath = \(photoIndexPath)")
                guard
                    let cell = self.galleryCollectionView.cellForItem(at: indexPath),
                    let photoCell = cell as? PhotoCollectionViewCell else {
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
