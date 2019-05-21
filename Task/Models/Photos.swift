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

extension Photo: Equatable {
    static func ==(lhs: Photo, rhs: Photo) -> Bool {
        return lhs.id! == rhs.id!
    }
}

class PhotoCategory {
    let albumId: Int? = nil
    let albumTitle:String = ""
    let imageURLs:[String] = []
}

