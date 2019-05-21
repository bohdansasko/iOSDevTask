//
//  BaseService.swift
//  Task
//
//  Created by mhmdraziq on 5/19/19.
//  Copyright © 2019 mhmdraziq. All rights reserved.
//

import Foundation
import Alamofire

// setting up the base service and its configurations
class BaseService {
    
    static let baseURL  = "http://jsonplaceholder.typicode.com/"
    static let shared = BaseService()
    
    public static let manager: Alamofire.SessionManager = {
        let configuration = URLSessionConfiguration.default
        configuration.timeoutIntervalForRequest = 10
        configuration.timeoutIntervalForResource = 10
        var manager = Alamofire.SessionManager(configuration: configuration)
        return manager
    }()
    
    
}


