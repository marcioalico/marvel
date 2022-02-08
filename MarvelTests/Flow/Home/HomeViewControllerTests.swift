//
//  HomeViewControllerTests.swift
//  MarvelTests
//
//  Created by Marcio Alico on 1/6/22.
//

import Foundation
import Quick
import Nimble
import RxSwift
@testable import Marvel

class HomeViewControllerTests: QuickSpec {
    
    override func spec() {
        
        var vc: HomeViewController!
        var router: HomeRouter!
        var viewModel: HomeViewModel!
        var characterMocks: CharactersServiceMock!
        
        describe("HomeViewController"){
            
            beforeEach {
                router = HomeRouter()
                viewModel = HomeViewModel()
                vc = router.getViewController() as? HomeViewController
                viewModel.bind(view: vc, router: router)
                
                characterMocks = CharactersServiceMock()
                _ = vc.view
            }
            
            // constrcutor
            describe("Constructor"){
                it("must have a router") {
                    expect(vc.router).notTo(beNil())
                }
                
                it("must have a ViewModel") {
                    expect(vc.viewModel).notTo(beNil())
                }
            }
            
            // test table view
            describe("get characters") {
                it("must get characters and update table view") {
                    characterMocks.getCharacters()
                        .subscribe(
                            onNext: { characters in
                                vc.characters = characters
                            }).disposed(by: DisposeBag())
                    
                    expect(vc.tableView).toNot(beNil())
                    expect(vc.tableView.indexPathsForVisibleRows).toNot(beNil())
                }
            }
            
            // test search bar
            
        }
    }
    
}
