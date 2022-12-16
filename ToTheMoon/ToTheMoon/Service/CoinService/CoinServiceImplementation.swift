//
//  CoinServiceImplementation.swift
//  ToTheMoon
//
//  Created by Marlon Ansale on 11/26/22.
//

import Foundation
import Combine

public class CoinServiceImplementation: CoinService {
    private let httpService: HttpService
    
    public init(httpService: HttpService) {
        self.httpService = httpService
    }
    
    public func fetchCoins() -> CoinsLoader {
        self.httpService.getAPI(withAppendURL: "coins/markets?vs_currency=usd&order=market_cap_desc&per_page=50")
        .tryMap(CoinMapper.map)
        .eraseToAnyPublisher()
    }
}
