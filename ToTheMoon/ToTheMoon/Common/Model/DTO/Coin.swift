//
//  Coin.swift
//  ToTheMoon
//
//  Created by Marlon Ansale on 11/26/22.
//

import Foundation

struct Coin: Identifiable, Decodable {
    let id: String
    let symbol: String
    let name: String
    let image: URL
    let currentPrice: Double
    let lastUpdated: Date
}
