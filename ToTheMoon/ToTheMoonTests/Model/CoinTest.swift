//
//  CoinTest.swift
//  ToTheMoonTests
//
//  Created by Marlon Ansale on 11/26/22.
//

import XCTest
import Foundation
@testable import ToTheMoon

final class CoinTest: XCTestCase {

    func test_decode_json_to_model() throws {
        let filename = "coin_return.json"
        
        guard let file = Bundle.main.url(forResource: filename, withExtension: nil) else {
            XCTFail("Couldn't find \(filename) in main bundle.")
            return
        }
        
        guard let data = try? Data(contentsOf: file) else {
            XCTFail("Couldn't load \(filename) from main bundle.")
            return
        }

        guard let coins: [Coin] = try? JSONDecoder.customDecoder.decode([Coin].self, from: data) else {
            XCTFail("Couldn't Decode.")
            return
        }

        let coin = coins.first
        XCTAssertEqual(coin?.currentPrice, 16614.17)
    }
}
