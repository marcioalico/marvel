//
//  ComicDetailsServiceMock.swift
//  MarvelTests
//
//  Created by Marcio Alico on 1/6/22.
//


@testable import Marvel
import Quick
import Nimble
import RxSwift
import RxCocoa

class ComicDetailsServiceMock {
    
    let comic1 = ComicDetail(id: 1, title: "comic 1", description: "desc 1", pageCount: 1, prices: nil, thumbnail: ImagesMocks().getMockedImage(), images: nil)
    let comic2 = ComicDetail(id: 2, title: "comic 2", description: "desc 2", pageCount: 2, prices: nil, thumbnail: ImagesMocks().getMockedImage(), images: nil)
    let comic3 = ComicDetail(id: 3, title: "comic 3", description: "desc 3", pageCount: 3, prices: nil, thumbnail: ImagesMocks().getMockedImage(), images: nil)
    
    var comicsListMock: [ComicDetail] = []
    
    func getComics() -> Observable<[ComicDetail]> {
        
        comicsListMock.append(comic1)
        comicsListMock.append(comic2)
        comicsListMock.append(comic3)
        
        return Observable.create { observer in
            observer.onNext(self.comicsListMock)
            observer.onCompleted()
            return Disposables.create()
        }
    }
    
}
