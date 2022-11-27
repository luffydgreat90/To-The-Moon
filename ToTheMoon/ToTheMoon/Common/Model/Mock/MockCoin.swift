//
//  MockCoin.swift
//  ToTheMoon
//
//  Created by Marlon Ansale on 11/26/22.
//

import Foundation

var mockCoin: Coin = {
    Coin(id: "BTC", symbol: "BTC", name: "Bitcoin", image: URL(string:"https://assets.coingecko.com/coins/images/1/large/bitcoin.png?1547033579")!, currentPrice: 23.22, lastUpdated: Date(), marketCapRank: 1)
}()

var mockCoinViewModel: CoinViewModel = {
    CoinViewModel(coin: mockCoin)
}()
