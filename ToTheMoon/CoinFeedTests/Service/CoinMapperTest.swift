//
//  CoinMapperTest.swift
//  ToTheMoonTests
//
//  Created by Marlon Ansale on 12/16/22.
//

import Foundation
import CoinFeed
import XCTest

enum ErrorDecode: Error {
    case decode
}

class CoinMapperTest: XCTestCase {
    
    private func makeDataAndResponse(file: StaticString = #filePath, line: UInt = #line) throws -> (Data,HTTPURLResponse) {
        let filename = "coin_return.json"

        guard let fileLocation = Bundle.main.url(forResource: filename, withExtension: nil) else {
            XCTFail("Couldn't find \(filename) in main bundle.", file: file, line: line)
            throw ErrorDecode.decode
        }
             
        guard let data = try? Data(contentsOf: fileLocation) else {
            XCTFail("Couldn't load \(filename) from main bundle.", file: file, line: line)
            throw ErrorDecode.decode
        }
        
        let httpResponse = HTTPURLResponse(code: 200)
        
        return (data, httpResponse)
    }
    
    func test_mapper_returns() throws {
        let (data, httpResponse) = try makeDataAndResponse()
        
        let coinViewModels = try CoinMapper.map(data, response: httpResponse)
        
        XCTAssertEqual(coinViewModels.count, 2)
    }
    
    func test_mapper_parse_correct() throws {
        let (data, httpResponse) = try makeDataAndResponse()
        let coinViewModels = try CoinMapper.map(data, response: httpResponse)
        
        let coinFirst = coinViewModels.first
        
        XCTAssertEqual(coinFirst?.id,"bitcoin")
        XCTAssertEqual(coinFirst?.name, "Bitcoin")
        XCTAssertEqual(coinFirst?.marketCapRank,"Rank #1")
    }
    
    func test_mapper_empty_data_with_code_200() throws {
        let emptyData = makeData()
        XCTAssertThrowsError(try CoinMapper.map(emptyData, response: HTTPURLResponse(code: 200)))
    }
    
    func test_mapper_non_empty_data_with_code_200() throws {
        let emptyData = makeData("non-empty data")
        XCTAssertThrowsError(try CoinMapper.map(emptyData, response: HTTPURLResponse(code: 200)))
    }
    
    func test_mapper_invalid_status_code() throws {
        let (data, _ ) = try makeDataAndResponse()
        let statusCodes = [100,199,201,300,404,500]
        
        try statusCodes.forEach { code in
            XCTAssertThrowsError(try CoinMapper.map(data, response: HTTPURLResponse(code: code)))
        }
        
    }
}
