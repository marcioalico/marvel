//
//  Stories.swift
//  marvel-ios
//
//  Created by Marcio Alico on 12/22/21.
//

import Foundation

struct Stories: Codable {
    let available: Int?
    let returned: Int?
    let collectionURI: String?
    let items: [Story]?
    
    enum CodingKeys: String, CodingKey {
        case available
        case returned
        case collectionURI
        case items
    }
}

struct Story: Codable {
    let resourceURI: String?
    let name: String?
    let type: String?
    
    enum CodingKeys: String, CodingKey {
        case resourceURI
        case name
        case type
    }
}
