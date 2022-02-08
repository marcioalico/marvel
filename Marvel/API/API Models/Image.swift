//
//  Image.swift
//  marvel-ios
//
//  Created by Marcio Alico on 12/22/21.
//

import Foundation

struct Image: Codable {
    let path: String?
    let ext: String?
    
    enum CodingKeys: String, CodingKey {
        case path
        case ext = "extension"
    }
}

extension Image {
    var url: URL? {
        if let path = path, let ext = ext {
            return URL(string: "\(path).\(ext)")
        } else {
            return nil
        }
    }
}

