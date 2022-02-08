//
//  AnimationRouter.swift
//  Marvel
//
//  Created by Marcio Alico on 1/5/22.
//

import Foundation
import UIKit

class MarvelAnimationRouter: MarvelRouter {
    
    private var sourceView: UIViewController?
    
    var viewController: MarvelViewController? {
        return getViewController()
    }
    
    func getViewController() -> MarvelViewController {
        let view = MarvelAnimationViewController(nibName: "AnimationView", bundle: Bundle.main)
        return view
    }
    
    func setViewController(sourceView: MarvelViewController?) {
        guard let view = sourceView else { fatalError("Error al create view") }
        self.sourceView = view
    }
}
