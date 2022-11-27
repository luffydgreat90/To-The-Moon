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
//    let priceChange24th: Double
//    let priceChangePercentage24h: Double
}
