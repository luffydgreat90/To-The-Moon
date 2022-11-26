//
//  CoinViewModel.swift
//  ToTheMoon
//
//  Created by Marlon Ansale on 11/26/22.
//

import SwiftUI

struct CoinViewModel: Hashable {
    let id: String
    let symbol: String
    let image: URL
    let currentPrice: Double
    let lastUpdated: Date
}

