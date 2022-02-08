//
//  Character.swift
//  marvel-ios
//
//  Created by Marcio Alico on 12/22/21.
//

import Foundation

struct Character: Codable {
    
    let id: Int
    let name: String
    let description: String?
    let thumbnail: Image?
    let comics: Comics?
    let series: Series?
    let stories: Stories?
    let events: Events?
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case description
        case thumbnail
        case comics
        case series
        case stories
        case events
    }
}

