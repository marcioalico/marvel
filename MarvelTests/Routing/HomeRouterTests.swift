//
//  HomeRouterTests.swift
//  MarvelTests
//
//  Created by Marcio Alico on 1/6/22.
//

import Foundation
import Quick
import Nimble
@testable import Marvel

class HomeRouterTests: QuickSpec {
    
    override func spec() {
        
        describe("Home Router tests") {
            
            var vc: HomeViewController!
            var router: HomeRouter!
            var viewModel: HomeViewModel!
            
            beforeEach {
               
                viewModel = HomeViewModel()
                router = HomeRouter()
                vc = router.getViewController() as? HomeViewController
                viewModel.bind(view: vc, router: router)
            }
            
            it("should return home view controller") {
                expect(router.getViewController()).toNot(beNil())
            }
            
            it("should set home view controller") {
                let oldVc = router.getViewController()
                let newVc = HomeViewController()
                router.setViewController(sourceView: newVc)
                expect(oldVc).toNot(be(equal(newVc)))
            }
        }
    }
    
}
