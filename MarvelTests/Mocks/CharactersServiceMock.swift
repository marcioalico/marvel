//
//  CharactersServiceMock.swift
//  MarvelTests
//
//  Created by Marcio Alico on 1/6/22.
//

import Foundation

@testable import Marvel
import Quick
import Nimble
import RxSwift
import RxCocoa

class CharactersServiceMock {
    
    let char1: Character = Character(id: 1,
                                     name: "char 1",
                                     description: "desc 1",
                                     thumbnail: ImagesMocks().getMockedImage(),
                                     comics: nil,
                                     series: nil,
                                     stories: nil,
                                     events: nil)
    
    let char2: Character = Character(id: 2,
                                     name: "char 2",
                                     description: "desc 2",
                                     thumbnail: ImagesMocks().getMockedImage(),
                                     comics: nil,
                                     series: nil,
                                     stories: nil,
                                     events: nil)
    
    let char3: Character = Character(id: 3,
                                     name: "char 3",
                                     description: "desc 3",
                                     thumbnail: ImagesMocks().getMockedImage(),
                                     comics: nil,
                                     series: nil,
                                     stories: nil,
                                     events: nil)
    
    var charactersListMock: [Character] = []
    
    func getCharacters() -> Observable<[Character]> {
        
        charactersListMock.append(char1)
        charactersListMock.append(char2)
        charactersListMock.append(char3)
        
        return Observable.create { observer in
            observer.onNext(self.charactersListMock)
            observer.onCompleted()
            return Disposables.create()
        }
    }
    
}
