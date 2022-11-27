//
//  CoinServiceImplementation.swift
//  ToTheMoon
//
//  Created by Marlon Ansale on 11/26/22.
//

import Foundation
import Combine

class CoinServiceImplementation: CoinService {
    func fetchCoins() -> AnyPublisher<[CoinViewModel], Error> {
        let url = URL(string: "https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=50")!
        
        return URLSession.shared.dataTaskPublisher(for: url)
            .retry(3)
            .tryMap { (data, response) in
            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else{
                throw URLError(.badServerResponse)
            }
            
            return data
        }.decode(type: [Coin].self, decoder: JSONDecoder.customDecoder)
        .tryMap { coins in
            coins.map{ CoinViewModel(coin: $0) }
        }
        .eraseToAnyPublisher()
        
    }
}
