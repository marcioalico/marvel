//
//  CharacterDetailRouter.swift
//  Marvel
//
//  Created by Marcio Alico on 1/2/22.
//

import Foundation
import UIKit

class CharacterDetailRouter: MarvelRouter {
    
    private var sourceView: MarvelViewController?
    var characterID: String?
    var character: Character?
    
    var viewController: UIViewController {
        return getViewController()
    }
    
    init(characterID: String? = "", character: Character? = nil) {
        self.characterID = characterID
        self.character = character
    }
    
    func getViewController() -> MarvelViewController {
        let view = CharacterDetailViewController(nibName: "CharacterDetailViewController", bundle: Bundle.main)
        view.characterID = self.characterID
        view.character = self.character
        return view
    }
    
    func setViewController(sourceView: MarvelViewController?) {
        guard let view = sourceView else { fatalError("Error al create view") }
        self.sourceView = view
    }
}
