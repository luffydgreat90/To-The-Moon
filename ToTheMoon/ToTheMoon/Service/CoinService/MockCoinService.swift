//
//  MockCoinService.swift
//  ToTheMoon
//
//  Created by Marlon Ansale on 11/26/22.
//

import Foundation
import Combine

class MockCoinService: CoinService {
    func fetchCoins() -> AnyPublisher<[Coin], Error> {
        
        return Future { promise in
            
            let filename = "coin_return.json"
            guard let file = Bundle.main.url(forResource: filename, withExtension: nil) else {
                promise(.failure( URLError.badURL as! Error))
                return
            }
            
            guard let data = try? Data(contentsOf: file) else {
                promise(.failure( URLError.badURL as! Error))
                return
            }

            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            decoder.dateDecodingStrategy = .formatted(.iso8601)

            guard let coins: [Coin] = try? decoder.decode([Coin].self, from: data) else {
                promise(.failure( URLError.badURL as! Error))
                return
            }
            
            promise(.success(coins))
        }.eraseToAnyPublisher()
         
    }
}
