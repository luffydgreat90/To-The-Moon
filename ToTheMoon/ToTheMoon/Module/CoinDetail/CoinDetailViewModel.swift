//
//  CoinDetailViewModel.swift
//  ToTheMoon
//
//  Created by Marlon Ansale on 11/26/22.
//

import SwiftUI

@MainActor
public final class CoinDetailViewModel: ObservableObject {
    let coin:CoinViewModel
    
    init(coin: CoinViewModel) {
        self.coin = coin
    }

}
