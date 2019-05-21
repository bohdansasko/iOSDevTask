//
//  UserService.swift
//  Task
//
//  Created by mhmdraziq on 5/19/19.
//  Copyright © 2019 mhmdraziq. All rights reserved.
//
import UIKit

class UserService {
    
    let serviceURL = "users"
    var fullURL = ""
    
    init () {
        fullURL = BaseService.baseURL+serviceURL;
    }
    func getUsers( completion: @escaping ([User]) -> ()) {
        BaseService.manager.request(self.fullURL  , method: .get, parameters: nil).validate().responseJSON { response in
            
            switch (response.result) {
            case .success:
                if let data = response.data  {
                    do{
                        let users = try JSONDecoder().decode([User].self, from: data)
                        print(users)
                        completion(users)
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
