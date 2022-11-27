//
//  CoinDetailViewModel.swift
//  ToTheMoon
//
//  Created by Marlon Ansale on 11/26/22.
//

import Foundation

@MainActor
final class CoinDetailViewModel: ObservableObject {
    let coin:CoinViewModel
    
    init(coin: CoinViewModel) {
        self.coin = coin
    }
}
