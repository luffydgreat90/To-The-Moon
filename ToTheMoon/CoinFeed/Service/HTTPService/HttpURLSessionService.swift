//
//  HttpURLSessionService.swift
//  ToTheMoon
//
//  Created by Marlon Ansale on 12/16/22.
//

import Foundation
import Combine

public class HttpURLSessionService : HttpService {
    
    let urlSession: URLSession
    
    public init(urlSession: URLSession = .shared) {
        self.urlSession = urlSession
    }
    
    public func getAPI(withAppendURL url:String) -> HTTPResult {
        let url = URL(string: "https://api.coingecko.com/api/v3/\(url)")!
      
        return self.urlSession.dataTaskPublisher(for: url)
            .retry(3)
            .tryMap { (data, response) in
                guard let httpResponse = response as? HTTPURLResponse else{
                    throw URLError(.badServerResponse)
                }
            
                return (data, httpResponse)
            }.eraseToAnyPublisher()
    }
}
