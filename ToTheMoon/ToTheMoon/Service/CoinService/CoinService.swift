//
//  CoinService.swift
//  ToTheMoon
//
//  Created by Marlon Ansale on 11/26/22.
//

import Foundation
import Combine

typealias CoinsLoader = AnyPublisher<[CoinViewModel], Error>

protocol CoinService {
    func fetchCoins() -> CoinsLoader
}
