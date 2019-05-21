//
//  AlbumsService.swift
//  Task
//
//  Created by mhmdraziq on 5/19/19.
//  Copyright © 2019 mhmdraziq. All rights reserved.
//


import Foundation
import Alamofire

enum AlbumsResult {
    case success([Album])
    case failure(Error)
}

enum AlbumError: Error {
    case invalidateIncomingData
}

enum ImageResult {
    case success(UIImage?)
    case failure(Error)
}

enum ImageError: Error {
    case invalidateData
}

class AlbumsService {
    let serviceURL = "photos"
    let fullURL: String
    
    private let imageStore = ImageStore()
    
    init () {
        fullURL = BaseService.baseURL+serviceURL;
    }
    
    func fetchAlbums(completion: @escaping (AlbumsResult) -> Void) {
        BaseService.manager.request(self.fullURL, method: .get, parameters: nil).validate().responseJSON { response in
            switch (response.result) {
            case .success:
                guard let data = response.data else {
                    OperationQueue.main.addOperation {
                        completion(.failure(AlbumError.invalidateIncomingData))
                    }
                    return
                }
                do {
                    let photos = try JSONDecoder().decode([Photo].self, from: data)
                    let albums = self.getAlbums(by: photos)
                    
                    OperationQueue.main.addOperation {
                        completion(.success(albums))
                    }
                } catch {
                    print(error)
                    OperationQueue.main.addOperation {
                        completion(.failure(error))
                    }
                }
            case .failure(let error):
                if error._code == NSURLErrorTimedOut {
                    print("Request timeout!")
                }
                OperationQueue.main.addOperation {
                    completion(.failure(error))
                }
            }
        }
    }
    
    func fetchImage(photo: Photo, completion: @escaping (ImageResult) -> Void) {
        guard let thumbnailUrl = photo.thumbnailUrl,
              let imageURL = URL(string: thumbnailUrl) else {
                completion(.failure(ImageError.invalidateData))
                return
        }
        
        BaseService.manager
            .request(imageURL)
            .responseData(completionHandler: { dataResponse in
                switch dataResponse.result {
                case .success(let data):
                    guard let image = UIImage(data: data) else {
                        completion(.failure(ImageError.invalidateData))
                        return
                    }
                    completion(.success(image))
                case .failure(let error):
                    completion(.failure(error))
                }
        })
    }
    
    private func getAlbums(by photos: [Photo]) -> [Album] {
        let groupedPhotos = Dictionary(grouping: photos) { $0.albumId }
        let sortGroupedPhotos = groupedPhotos.sorted(by: { $0.key! < $1.key! })
        
        let albums = sortGroupedPhotos.compactMap({ (key, value) -> Album in
            Album(id: key!, photos: value)
        })
        
        return albums
    }
    
    
}
