//
//  Constants.swift
//  Marvel
//
//  Created by Marcio Alico on 12/28/21.
//

import Foundation
import UIKit

struct Constants {
    
    static let publicKey = "3dc43ff515ceccddd66dfa0df49f6e5b"
    static let privateKey = "abe7d92e20f41c430a309342fc3d5cba108acfd8"
    static let baseURL = "https://gateway.marvel.com:443/"
    
    struct Endpoints {
        static let characterList = "v1/public/characters"
        static let characterComics = "v1/public/characters/" // + /character ID/comics
    }
    
    struct Colors {
        static let red = UIColor(named: "MarvelRed")!
        static let blue = UIColor(named: "MarvelBlue")!
        static let gray = UIColor(named: "MarvelGray")!
        static let orange = UIColor(named: "MarvelOrange")!
    }
    
    struct Fonts {
        static let bold = "Marvel-Bold"
        static let italic = "Marvel-Italic"
        static let regular = "Marvel-Regular"
        static let boldItalic = "Marvel-BoldItalic"
    }
    
    static let defaultError = "Ah ocurrido un error, intente nuevamente por favor."
}
