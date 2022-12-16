//
//  HttpService.swift
//  ToTheMoon
//
//  Created by Marlon Ansale on 11/28/22.
//

import Foundation
import Combine

public typealias HTTPResult = AnyPublisher<(Data, Int), Error>

public protocol HttpService {
    func getAPI(withAppendURL url:String) -> HTTPResult
}
