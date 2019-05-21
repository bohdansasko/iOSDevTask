//
//  Album.swift
//  Task
//
//  Created by Bogdan Sasko on 5/21/19.
//  Copyright © 2019 mhmdraziq. All rights reserved.
//

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
