//
//  CoinService.swift
//  ToTheMoon
//
//  Created by Marlon Ansale on 11/26/22.
//

import Foundation
import Combine

public typealias CoinsLoader = AnyPublisher<[CoinViewModel], Error>

public protocol CoinService {
    func fetchCoins() -> CoinsLoader
}
