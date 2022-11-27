//
//  Coin.swift
//  ToTheMoon
//
//  Created by Marlon Ansale on 11/26/22.
//

import Foundation

struct Coin: Decodable {
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
