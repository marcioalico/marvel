//
//  ModelTests.swift
//  MarvelTests
//
//  Created by Marcio Alico on 1/6/22.
//

import Foundation
@testable import Marvel
import Quick
import Nimble

class ModelTests: QuickSpec {
    
    override func spec() {
        
        var characterList: [Character]!
        var comicsList: [ComicDetail]!
        var decoder: JSONDecoder!
        
        describe("Decode JSON responses test"){
            
            beforeEach {
                decoder = JSONDecoder()
            }
            
            it("List of Characters from JSON") {
                
                if let path = Bundle.main.path(forResource: "char_list", ofType: "json") {
                    
                    let url = URL(fileURLWithPath: path)
                    let data = try Data(contentsOf: url)
                    
                    do {
                        let charactersResponse = try decoder.decode(CharactersResponse.self, from: data)
                        guard let characters = charactersResponse.data?.results else { return }
                        characterList = characters
                    } catch {
                        // handle error
                    }
                    
                    expect(characterList).toNot(beNil())
                    expect(characterList.count).to(beGreaterThan(0))
                    expect(characterList.first).to(beAnInstanceOf(Character.self))
                }
            }
            
            it("List of character's Comics from JSON") {
                if let path = Bundle.main.path(forResource: "char_comics", ofType: "json") {
                    
                    let url = URL(fileURLWithPath: path)
                    let data = try Data(contentsOf: url)
                    
                    do {
                        let charactersResponse = try decoder.decode(CharacterComicsDetailResponse.self, from: data)
                        guard let comics = charactersResponse.data?.results else { return }
                        comicsList = comics
                    } catch {

                    }
                    
                    expect(comicsList).toNot(beNil())
                    expect(comicsList.count).to(beGreaterThan(0))
                    expect(comicsList.first).to(beAnInstanceOf(ComicDetail.self))
                }
            }
        }
        
    }  
    
}
