//
//  Events.swift
//  marvel-ios
//
//  Created by Marcio Alico on 12/22/21.
//

import Foundation

struct Events: Codable {
    let available: Int?
    let returned: Int?
    let collectionURI: String?
    let items: [Event]?
    
    enum CodingKeys: String, CodingKey {
        case available
        case returned
        case collectionURI
        case items
    }
}

struct Event: Codable {
    let resourceURI: String?
    let name: String?
    
    enum CodingKeys: String, CodingKey {
        case resourceURI
        case name
    }
}
