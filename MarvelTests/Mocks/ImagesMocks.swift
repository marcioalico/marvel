//
//  ImagesMocks.swift
//  MarvelTests
//
//  Created by Marcio Alico on 1/6/22.
//

import Foundation
@testable import Marvel

class ImagesMocks {
    
    let mockedPaths: [String] = ["http://i.annihil.us/u/prod/marvel/i/mg/c/e0/535fecbbb9784", "http://i.annihil.us/u/prod/marvel/i/mg/6/20/52602f21f29ec", "http://i.annihil.us/u/prod/marvel/i/mg/b/40/image_not_available"]
    
    func getMockedImage() -> Image {
        return Image(path: mockedPaths.shuffled().first, ext: ".jpg")
    }
}
