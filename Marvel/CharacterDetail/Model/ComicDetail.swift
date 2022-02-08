//
//  CharacterComicsDetail.swift
//  Marvel
//
//  Created by Marcio Alico on 1/2/22.
//

import Foundation

// MARK: - CharacterComicsDetail

struct ComicDetail: Codable {
    let id: Int
    let title: String?
    let description: String?
    let pageCount: Int?
    let prices: [Price]?
    let thumbnail: Image?
    let images: [Image]?
    
    enum CodingKeys: String, CodingKey {
        case id, pageCount
        case title, description
        case prices
        case thumbnail
        case images
    }
}


// MARK: - Response models

// CharacterComicsDetailResponse
struct CharacterComicsDetailResponse: Codable {
    let data: CharacterComicsDetailDataResponse?
    
    enum CodingKeys: String, CodingKey {
        case data
    }
}

// CharacterComicsDetailDataResponse
struct CharacterComicsDetailDataResponse: Codable {
    let results: [ComicDetail]?
    
    enum CodingKeys: String, CodingKey {
        case results
    }
}

// Price
struct Price: Codable {
    let type: String
    let price: Double
}
