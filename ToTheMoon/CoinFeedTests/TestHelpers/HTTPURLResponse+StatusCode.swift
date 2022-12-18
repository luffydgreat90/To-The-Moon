//
//  HTTPURLResponse+StatusCode.swift
//  CoinFeedTests
//
//  Created by Marlon Ansale on 12/18/22.
//

import Foundation

extension HTTPURLResponse {
    convenience init(code:Int) {
        self.init(url: URL(string: "https://any-url.com")!, statusCode: code, httpVersion: nil, headerFields: nil)!
    }
}
