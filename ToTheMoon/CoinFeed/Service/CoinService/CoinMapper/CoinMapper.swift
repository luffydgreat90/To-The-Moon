//
//  CoinMapper.swift
//  ToTheMoon
//
//  Created by Marlon Ansale on 11/28/22.
//

import Foundation
fileprivate struct Coin: Decodable {
    let id: String
    let symbol: String
    let name: String
    let image: URL
    let currentPrice: Double
    let lastUpdated: Date
    let marketCapRank: Int
    let priceChange24h: Double
    let high24h: Double
    let low24h: Double
    let priceChangePercentage24h: Double
    
    private enum CodingKeys: String, CodingKey {
        case id, symbol, name, image
        case currentPrice = "current_price"
        case lastUpdated = "last_updated"
        case marketCapRank = "market_cap_rank"
        case priceChange24h = "price_change_24h"
        case high24h = "high_24h"
        case low24h = "low_24h"
        case priceChangePercentage24h = "price_change_percentage_24h"
    }
}

public enum CoinMapper {
    public enum Error: Swift.Error {
        case invalidData
    }
    
    public static func map(_ data: Data, response: HTTPURLResponse) throws -> [CoinViewModel] {
        let jsonDecoder:JSONDecoder = .customDecoder
    
        guard let coins:[Coin] = try? jsonDecoder.decode([Coin].self, from: data), response.statusCode == 200 else{
            throw Error.invalidData
        }
        
        return coins.toCoinViewModel()
    }

}

private extension Array where Element == Coin {
    func toCoinViewModel() -> [CoinViewModel] {
        self.map { coin in
            
            let imgSmall = coin.image.absoluteString.replacingOccurrences(of: "/large/", with: "/small/")
            
            return CoinViewModel(
                id: coin.id,
                symbol:coin.symbol.uppercased(),
                name: coin.name,
                image: coin.image,
                imageSmall: URL(string: imgSmall)!,
                price: coin.currentPrice.usdCurrency,
                lastUpdated: coin.lastUpdated,
                marketCapRank: "Rank #\(coin.marketCapRank)",
                high24h: coin.high24h.usdCurrency,
                low24h: coin.low24h.usdCurrency,
                priceChangePercentage24h: coin.priceChangePercentage24h.percentage,
                statusColor: coin.priceChangePercentage24h > 0 ? .positive : .negative)
        }
    }
}

