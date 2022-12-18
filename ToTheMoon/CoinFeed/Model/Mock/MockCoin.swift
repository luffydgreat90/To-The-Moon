//
//  MockCoin.swift
//  ToTheMoon
//
//  Created by Marlon Ansale on 11/26/22.
//

import Foundation


public var mockCoinViewModel: CoinViewModel = {
    CoinViewModel(id: "BTC",
                  symbol: "BTC",
                  name: "Bitcoin",
                  image: URL(string:"https://assets.coingecko.com/coins/images/1/large/bitcoin.png?1547033579")!,
                  imageSmall: URL(string:"https://assets.coingecko.com/coins/images/1/small/bitcoin.png?1547033579")!,
                  price: "$23.22",
                  lastUpdated: Date(),
                  marketCapRank: "Rank #1",
                  high24h: "$25.33",
                  low24h: "$10.22",
                  priceChangePercentage24h: "$0.10",
                  statusColor: .green)
}()
