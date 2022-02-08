//
//  MarvelAnimationViewModel.swift
//  Marvel
//
//  Created by Marcio Alico on 1/5/22.
//

import Foundation

class MarvelAnimationViewModel: MarvelViewModel {
    
    var view: MarvelViewController?
    var router: MarvelRouter?
    
    func bind(view: MarvelViewController, router: MarvelRouter) {
        self.view = view
        self.router = router
        self.router?.setViewController(sourceView: view)
    }
    
}
