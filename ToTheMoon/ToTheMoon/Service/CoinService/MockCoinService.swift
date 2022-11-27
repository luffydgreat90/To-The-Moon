//
//  MockCoinService.swift
//  ToTheMoon
//
//  Created by Marlon Ansale on 11/26/22.
//

import Foundation
import Combine

public class MockCoinService: CoinService {
    func fetchCoins() -> CoinsLoader {
        
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

            guard let coins: [Coin] = try? JSONDecoder.customDecoder.decode([Coin].self, from: data) else {
                promise(.failure( URLError.badURL as! Error))
                return
            }
            
            promise(.success(coins.map { CoinViewModel(coin: $0) } ))
            
        }.eraseToAnyPublisher()
         
    }
}
