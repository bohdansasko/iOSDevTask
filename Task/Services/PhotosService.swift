//
//  PhotosService.swift
//  Task
//
//  Created by mhmdraziq on 5/19/19.
//  Copyright © 2019 mhmdraziq. All rights reserved.
//


import Foundation
import Alamofire

class PhotosService {
    
    let serviceURL = "photos"
    var fullURL = ""
    init () {
        fullURL = BaseService.baseURL+serviceURL;
    }
    func getImages( completion: @escaping ([Photo]  ) -> ()) {
        BaseService.manager.request(self.fullURL  , method: .get, parameters: nil).validate().responseJSON { response in
            switch (response.result) {
            case .success:
                if let data = response.data  {
                    do{
                        let photos = try JSONDecoder().decode([Photo].self, from: data)
                        print(photos)
                        completion(photos)
                    }catch let err {
                        print(err)
                    }
                }
                break
            case .failure(let error):
                if error._code == NSURLErrorTimedOut {
                    print("Request timeout!")
                }
            }
        }
    }
}
