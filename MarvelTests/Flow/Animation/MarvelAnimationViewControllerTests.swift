//
//  MarvelAnimationViewControllerTests.swift
//  MarvelTests
//
//  Created by Marcio Alico on 1/5/22.
//

import Foundation
@testable import Marvel
import Nimble
import Quick
import XCTest

class MarvelAnimationViewControllerTests: QuickSpec {

    override func spec() {
        
        var vc: MarvelAnimationViewController!
        var router: MarvelAnimationRouter!
        var viewModel: MarvelAnimationViewModel!
        
        describe("AnimationViewController") {
            
            beforeEach {
                router = MarvelAnimationRouter()
                viewModel = MarvelAnimationViewModel()
                vc = router.getViewController() as? MarvelAnimationViewController
                viewModel.bind(view: vc, router: router)
                
                _ = vc.view
            }
            
            describe("Constructors") {
                it("must have a router") {
                    expect(vc.router).notTo(beNil())
                }
                
                it("must have a ViewModel") {
                    expect(vc.viewModel).notTo(beNil())
                }
            }
            
        }
    }
}
