//
//  CoinViewModel.swift
//  ToTheMoon
//
//  Created by Marlon Ansale on 11/26/22.
//

import SwiftUI

public struct CoinViewModel: Identifiable {
    public let id: String
    public let symbol: String
    public let name: String
    public let image: URL
    public let imageSmall: URL
    public let price: String
    public let lastUpdated: Date
    public let marketCapRank: String
    public let high24h: String
    public let low24h: String
    public let priceChangePercentage24h: String
    public let statusColor: Color
    
    init(id: String, symbol: String, name: String, image: URL, imageSmall: URL, price: String, lastUpdated: Date, marketCapRank: String, high24h: String, low24h: String, priceChangePercentage24h: String, statusColor: Color) {
        self.id = id
        self.symbol = symbol
        self.name = name
        self.image = image
        self.imageSmall = imageSmall
        self.price = price
        self.lastUpdated = lastUpdated
        self.marketCapRank = marketCapRank
        self.high24h = high24h
        self.low24h = low24h
        self.priceChangePercentage24h = priceChangePercentage24h
        self.statusColor = statusColor
    }
    
}

