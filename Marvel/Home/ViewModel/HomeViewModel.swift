//
//  HomeViewModel.swift
//  Marvel
//
//  Created by Marcio Alico on 12/28/21.
//

import Foundation
import RxSwift

class HomeViewModel: MarvelViewModel {
    
    var view: MarvelViewController?
    var router: MarvelRouter?
    
    private var apiClient = ApiClient()
    
    func bind(view: MarvelViewController, router: MarvelRouter) {
        self.view = view
        self.router = router
        self.router?.setViewController(sourceView: view)
    }
    
    func getCharacters() -> Observable<[Character]> {
        return apiClient.getCharacters()
    }
}
