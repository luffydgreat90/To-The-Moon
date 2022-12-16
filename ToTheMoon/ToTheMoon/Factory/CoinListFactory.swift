//
//  CoinListFactory.swift
//  ToTheMoon
//
//  Created by Marlon Ansale on 11/26/22.
//

import SwiftUI

struct CoinListFactory {
    @MainActor static func createCoinListViewController() -> CoinListViewController {
        // Dependency Injection
        let coinService = CoinServiceImplementation(httpService: HttpURLSessionService())
        let coinListViewModel: CoinListViewModel = CoinListViewModel(coinService: coinService)
        return CoinListViewController(viewModel: coinListViewModel)
    }
    
    @MainActor static func createCoinListMockViewController() -> CoinListViewController {
        let mockCoinService = MockCoinService()
        let coinListViewModel: CoinListViewModel = CoinListViewModel(coinService: mockCoinService)
        return CoinListViewController(viewModel: coinListViewModel)
    }
}
