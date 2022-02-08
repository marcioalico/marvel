//
//  CharactersResponse.swift
//  marvel-ios
//
//  Created by Marcio Alico on 12/22/21.
//

import Foundation

struct CharactersResponse: Codable {
    let data: CharactersDataResponse?
    
    enum CodingKeys: String, CodingKey {
        case data
    }
}

struct CharactersDataResponse: Codable {
    let results: [Character]?
    
    enum CodingKeys: String, CodingKey {
        case results
    }
}
