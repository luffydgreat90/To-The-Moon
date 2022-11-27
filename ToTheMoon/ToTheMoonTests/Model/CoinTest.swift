//
//  CoinTest.swift
//  ToTheMoonTests
//
//  Created by Marlon Ansale on 11/26/22.
//

import XCTest
import Foundation
@testable import ToTheMoon

enum ErrorDecode: Error {
    case decode
}

final class CoinTest: XCTestCase {

    func makeCoinTest() throws -> Coin {
        let filename = "coin_return.json"
        
        guard let file = Bundle.main.url(forResource: filename, withExtension: nil) else {
            XCTFail("Couldn't find \(filename) in main bundle.")
            throw ErrorDecode.decode
        }
        
        guard let data = try? Data(contentsOf: file) else {
            XCTFail("Couldn't load \(filename) from main bundle.")
            throw ErrorDecode.decode
        }

        guard let coins: [Coin] = try? JSONDecoder.customDecoder.decode([Coin].self, from: data) else {
            XCTFail("Couldn't Decode.")
            throw ErrorDecode.decode
        }

        return coins.first!
    }
    
    func test_decode_json_to_model() throws {
        guard let coin = try? makeCoinTest() else{
            XCTFail("Couldn't Get Coin.")
            return
        }
        
        XCTAssertEqual(coin.currentPrice,16614.17)
        XCTAssertEqual(coin.marketCapRank,1)
    }
}
