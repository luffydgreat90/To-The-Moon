//
//  CoinListViewModel.swift
//  ToTheMoon
//
//  Created by Marlon Ansale on 11/26/22.
//

import Foundation
import Combine

@MainActor
final class CoinListViewModel: ObservableObject {
    private let coinService:CoinService
    private var cancellables: Set<AnyCancellable> =  Set<AnyCancellable>()
    
    @Published var coins = [CoinViewModel]()
    @Published var search: String = ""
    
    init(coinService: CoinService!) {
        self.coinService = coinService
        self.fetchCoins()
    }
    
    
    
    func fetchCoins(){
        self.coinService.fetchCoins()
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { [weak self] result in
                switch  result {
                case .finished:
                    break
                case .failure:
                        self?.coins =  []
                    break
                }
            
            }, receiveValue: { [weak self] result in
                self?.coins = result
            
            }).store(in: &cancellables)
    }
}
