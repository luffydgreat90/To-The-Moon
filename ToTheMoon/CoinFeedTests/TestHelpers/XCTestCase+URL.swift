//
//  XCTestCase+URL.swift
//  ToTheMoonTests
//
//  Created by Marlon Ansale on 12/16/22.
//

import XCTest

extension XCTestCase {
    func makeURL() -> URL {
        URL(string: "https//:sample-url.com")!
    }
}
