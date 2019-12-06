//
//  Post.swift
//  HiWeather
//
//  Created by edward chow on 26/11/19.
//  Copyright © 2019 edward chow. All rights reserved.
//

import Foundation

struct Post: Codable{
    let id: Int?
    let title: String?
    let body: String?
    let userIdentifier: Int?
    
    enum CodingKeys: String, CodingKey{
    case id
    case title
    case body
    case userIdentifier = "userId"
    }
}
