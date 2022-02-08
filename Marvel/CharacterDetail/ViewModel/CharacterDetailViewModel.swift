//
//  CharacterDetailViewModel.swift
//  Marvel
//
//  Created by Marcio Alico on 1/2/22.
//

import Foundation
import RxSwift

class CharacterDetailViewModel: MarvelViewModel {
    
    internal weak var view: MarvelViewController?
    internal var router: MarvelRouter?
    
    private var apiClient = ApiClient()
    
    func bind(view: MarvelViewController, router: MarvelRouter){
        self.view = view
        self.router = router
        self.router?.setViewController(sourceView: view)
    }
    
    func getCharacterDetail(_ id: String) -> Observable<[ComicDetail]> {
        return apiClient.getCharacterComicsWith(id: id)
    }
    
}
