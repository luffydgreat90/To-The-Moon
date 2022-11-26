//
//  CoinService.swift
//  ToTheMoon
//
//  Created by Marlon Ansale on 11/26/22.
//

import Foundation
import Combine

protocol CoinService {
    func fetchCoins() -> AnyPublisher<[Coin], Error>
}
