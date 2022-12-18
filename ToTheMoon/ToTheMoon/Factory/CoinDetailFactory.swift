//
//  CoinDetailFactory.swift
//  ToTheMoon
//
//  Created by Marlon Ansale on 11/26/22.
//

import SwiftUI
import CoinFeed

struct CoinDetailFactory {
    @MainActor static func createCoinDetailViewController(coin:CoinViewModel) -> CoinDetailViewController {
        let viewModel:CoinDetailViewModel = CoinDetailViewModel(coin: coin)
        return CoinDetailViewController(viewModel: viewModel)
    }
    
    @MainActor static func createMockCoinDetailViewController() -> CoinDetailViewController {
        let viewModel:CoinDetailViewModel = CoinDetailViewModel(coin: mockCoinViewModel)
        return CoinDetailViewController(viewModel: viewModel)
    }
}
