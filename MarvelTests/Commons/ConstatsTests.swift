//
//  ConstatsTests.swift
//  MarvelTests
//
//  Created by Marcio Alico on 1/6/22.
//

@testable import Marvel
import Quick
import Nimble

class ConstatsTests: QuickSpec {
    
    override func spec() {
        
        describe("Constant class") {
            
            it("HTTP Constants tests") {
                expect(Constants.baseURL).to(match("https://gateway.marvel.com:443/"))
                expect(Constants.publicKey).toNot(beEmpty())
                expect(Constants.privateKey).toNot(beEmpty())
                
                expect(Constants.Endpoints.characterList).to(match("v1/public/characters"))
                expect(Constants.Endpoints.characterComics).to(match("v1/public/characters"))
            }
            
            it("Constants Colors tests") {
                expect(Constants.Colors.red).toNot(beNil())
                expect(Constants.Colors.blue).toNot(beNil())
                expect(Constants.Colors.gray).toNot(beNil())
                expect(Constants.Colors.orange).toNot(beNil())
            }
            
            it("Constants Fonts tests") {
                expect(Constants.Fonts.bold).toNot(beNil())
                expect(Constants.Fonts.bold).to(match("Marvel-Bold"))
                
                expect(Constants.Fonts.italic).toNot(beNil())
                expect(Constants.Fonts.italic).to(match("Marvel-Italic"))
                
                expect(Constants.Fonts.regular).toNot(beNil())
                expect(Constants.Fonts.regular).to(match("Marvel-Regular"))
                
                expect(Constants.Fonts.boldItalic).toNot(beNil())
                expect(Constants.Fonts.boldItalic).to(match("Marvel-BoldItalic"))
            }
            
            it("Default error message") {
                expect(Constants.defaultError).toNot(beNil())
            }
        }
    }
}

