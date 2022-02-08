//
//  ApiClient.swift
//  Marvel
//
//  Created by Marcio Alico on 12/28/21.
//

import Foundation
import RxSwift

class ApiClient {
    
    func getCharacters() -> Observable<[Character]> {
        return Observable.create { observer in
            let session = URLSession.shared
            
            let url = URL(string: Constants.baseURL + Constants.Endpoints.characterList)
            var urlComponents: URLComponents = URLComponents(url: url!, resolvingAgainstBaseURL: true)!
            
            let timestamp = "\(Date().timeIntervalSince1970)"
            let hash = "\(timestamp)\(Constants.privateKey)\(Constants.publicKey)".md5
            
            let queryItems = [
                URLQueryItem(name: "ts", value: timestamp),
                URLQueryItem(name: "hash", value: hash),
                URLQueryItem(name: "apikey", value: Constants.publicKey),
                URLQueryItem(name: "limit", value: "100")
            ]
            urlComponents.queryItems = queryItems
            
            var request = URLRequest(url: urlComponents.url!)
            request.httpMethod = "GET"
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
            
            session.dataTask(with: request) { (data, response, error) in
                guard let data = data, error == nil, let response = response as? HTTPURLResponse else { return }
                
                switch response.statusCode {
                case 200:
                    do {
                        let decoder = JSONDecoder()
                        let charactersResponse = try decoder.decode(CharactersResponse.self, from: data)
                        guard let characters = charactersResponse.data?.results else { return }
                        observer.onNext(characters)
                    } catch let err {
                        observer.onError(err)
                        print("Error \(err) in \(#function)")
                    }
                case 401:
                    print("Error 401 in \(#function)")
                default:
                    print("Unknown status code in \(#function)")
                }
                observer.onCompleted()
            }.resume()
            
            return Disposables.create()
        }
    }
    
    let kComicsSuffix = "/comics"
    
    func getCharacterComicsWith(id: String) -> Observable<[ComicDetail]> {
        return Observable.create { observer in
            let session = URLSession.shared
            
            let url = URL(string: Constants.baseURL + Constants.Endpoints.characterComics + "\(id)" + self.kComicsSuffix)
            var urlComponents: URLComponents = URLComponents(url: url!, resolvingAgainstBaseURL: true)!
            
            let timestamp = "\(Date().timeIntervalSince1970)"
            let hash = "\(timestamp)\(Constants.privateKey)\(Constants.publicKey)".md5
            
            let queryItems = [
                URLQueryItem(name: "ts", value: timestamp),
                URLQueryItem(name: "hash", value: hash),
                URLQueryItem(name: "apikey", value: Constants.publicKey)
            ]
            urlComponents.queryItems = queryItems
            
            var request = URLRequest(url: urlComponents.url!)
            request.httpMethod = "GET"
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
            
            session.dataTask(with: request) { (data, response, error) in
                guard let data = data, error == nil, let response = response as? HTTPURLResponse else { return }
                
                switch response.statusCode {
                case 200:
                    do {
                        let decoder = JSONDecoder()
                        let characterComics = try decoder.decode(CharacterComicsDetailResponse.self, from: data)
                        guard let comics = characterComics.data?.results else { return }
                        observer.onNext(comics)
                    } catch let err {
                        observer.onError(err)
                        print("Error \(err) in \(#function)")
                    }
                case 401:
                    print("Error 401 in \(#function)")
                default:
                    print("Unknown status code in \(#function)")
                }
                observer.onCompleted()
            }.resume()
            
            return Disposables.create()
        }
    }
}

