//
//  MockCoinService.swift
//  ToTheMoon
//
//  Created by Marlon Ansale on 11/26/22.
//

import Foundation
import Combine

public class MockCoinService: CoinService {
    public func fetchCoins() -> CoinsLoader {
        
        return Future { promise in
            promise(.success([mockCoinViewModel]))
        }.eraseToAnyPublisher()
         
    }
}
