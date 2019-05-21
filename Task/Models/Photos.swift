//
//  Photos.swift
//  Task
//
//  Created by mhmdraziq on 5/19/19.
//  Copyright © 2019 mhmdraziq. All rights reserved.
//

import Foundation

// Photo
class Photo: Codable {
    let albumId, id: Int?
    let title: String?
    let url, thumbnailUrl: String?
}


class PhotoCategory {
    let albumId: Int? = nil
    let albumTitle:String = ""
    let imageURLs:[String] = []
}

// MARK - Album with photos
struct Album {
    let id: Int
    let photos: [Photo]
}

extension Album: Hashable {
    var hashValue: Int {
        return id.hashValue
    }
    
    static func == (lhs: Album, rhs: Album) -> Bool {
        return lhs.id == rhs.id
    }
}
