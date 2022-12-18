//
//  XCTestCase+Data.swift
//  CoinFeedTests
//
//  Created by Marlon Ansale on 12/18/22.
//

import XCTest

extension XCTestCase {
    func makeData(_ value: String = "") -> Data {
        Data(value.utf8)
    }
}
