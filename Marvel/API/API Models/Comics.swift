//
//  Comics.swift
//  marvel-ios
//
//  Created by Marcio Alico on 12/22/21.
//

import Foundation

struct Comics: Codable {
    let available: Int?
    let returned: Int?
    let collectionURI: String?
    let items: [Comic]?
    
    enum CodingKeys: String, CodingKey {
        case available
        case returned
        case collectionURI
        case items
    }
}

struct Comic: Codable {
    let name: String
    let resourceURI: String
    
    enum CodingKeys: String, CodingKey {
        case name
        case resourceURI
    }
}
