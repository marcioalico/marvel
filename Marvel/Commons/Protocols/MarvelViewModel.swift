//
//  MarvelViewModel.swift
//  Marvel
//
//  Created by Marcio Alico on 12/28/21.
//

import Foundation

protocol MarvelViewModel {
    
    var view: MarvelViewController? { get set }
    var router: MarvelRouter? { get set }
    
    func bind(view: MarvelViewController, router: MarvelRouter)
}
