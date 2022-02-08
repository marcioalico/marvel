//
//  HomeRouter.swift
//  Marvel
//
//  Created by Marcio Alico on 12/28/21.
//

import Foundation
import UIKit

class HomeRouter: MarvelRouter {
    
    private var sourceView: UIViewController?
    
    var viewController: MarvelViewController? {
        return getViewController()
    }
    
    func getViewController() -> MarvelViewController {
        let view = HomeViewController(nibName: "HomeViewController", bundle: Bundle.main)
        return view
    }
    
    func setViewController(sourceView: MarvelViewController?) {
        guard let view = sourceView else { fatalError("Error al create view") }
        self.sourceView = view
    }
    
    func navigateToCharacterComicsDetail(_ id: String, character: Character?) {
        let characterComicsVC = CharacterDetailRouter(characterID: id, character: character).viewController
        sourceView?.navigationController?.pushViewController(characterComicsVC, animated: true)
    }
}
