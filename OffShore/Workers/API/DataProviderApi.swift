//
//  DataProviderApi.swift
//

import Foundation
import Alamofire

enum AppPath
{
    static let fixturePath = "https://storage.googleapis.com/cdn-og-test-api/test-task/fixtures.json"
    static let resultPath = "https://storage.googleapis.com/cdn-og-test-api/test-task/results.json"
}

final class DataProviderApi
{
    
    init()
    {
        //TO DO
    }
    
    func fetchFixtures(completionHandler completion: @escaping ([Fixture]) -> Void)
    {
        let urlString = AppPath.fixturePath
        
        print(urlString)
        
        Alamofire
            .request(urlString, method: .get)
            .responseJSON { response in
                guard let jsonData = response.data else {
                    completion([])
                    return
                }
                do {
                    let decoder = JSONDecoder()
                      decoder.dateDecodingStrategy = .iso8601
                    let fixtures = try decoder.decode([Fixture].self, from:
                            jsonData)
                     completion(fixtures)
                } catch let parsingError {
                    print("Error", parsingError)
                    completion([])
                }
        }
    }
    
    func fetchResults(completionHandler completion: @escaping ([Result]) -> Void)
    {
        let urlString = AppPath.resultPath
        
        print(urlString)
        
        Alamofire
            .request(urlString, method: .get)
            .responseJSON { response in
                guard let jsonData = response.data else {
                    completion([])
                    return
                }
                
                do {
                    let decoder = JSONDecoder()
                    decoder.dateDecodingStrategy = .iso8601
                    let results_ = try decoder.decode([Result].self, from:
                            jsonData)
                    completion(results_)
                } catch let parsingError {
                    print("Error", parsingError)
                    completion([])
                }
        }
    }
}
