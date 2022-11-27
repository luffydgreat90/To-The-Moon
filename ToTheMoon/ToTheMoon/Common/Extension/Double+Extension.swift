//
//  Double+Extension.swift
//  ToTheMoon
//
//  Created by Marlon Ansale on 11/27/22.
//

import Foundation

extension Double {
    
    var usdCurrency: String {
        let currencyFormatter = NumberFormatter()
        currencyFormatter.usesGroupingSeparator = true
        currencyFormatter.numberStyle = .currency
        currencyFormatter.locale = Locale(identifier: "en_US")
        
        return currencyFormatter.string(for: self) ?? ""
    }
}
