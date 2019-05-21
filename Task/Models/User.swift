//
//  User.swift
//  Task
//
//  Created by mhmdraziq on 5/19/19.
//  Copyright © 2019 mhmdraziq. All rights reserved.
//

import Foundation

// User
class User: Codable {
    let id: Int?
    let name, username, email: String?
    let address: Address?
    let phone, website: String?
    let company: Company?
}

// Address
class Address: Codable {
    let street, suite, city, zipcode: String?
    let geo: Geo?
}

// Geo
class Geo: Codable {
    let lat, lng: String?
}

// Company
class Company: Codable {
    let name, catchPhrase, bs: String?
}
