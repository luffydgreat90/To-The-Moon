//
//  CoinViewModel.swift
//  ToTheMoon
//
//  Created by Marlon Ansale on 11/26/22.
//

import SwiftUI

struct CoinViewModel: Identifiable {
    let id: String
    let symbol: String
    let name: String
    let image: URL
    let imageSmall: URL
    let price: String
    let lastUpdated: Date
    let marketCapRank: String
    
    init(coin:Coin) {
        self.id = coin.id
        self.symbol = coin.symbol
        self.name = coin.name
        self.image = coin.image
        let imgSmall = image.absoluteString.replacingOccurrences(of: "/large/", with: "/small/")
        self.imageSmall = URL(string: imgSmall)!
        self.lastUpdated = coin.lastUpdated
        self.marketCapRank = "Rank #\(coin.marketCapRank)"
        self.price = "$\(coin.currentPrice)"
    }
}

