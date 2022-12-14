//
//  CoinItemView.swift
//  ToTheMoon
//
//  Created by Marlon Ansale on 11/26/22.
//

import SwiftUI

public struct CoinItemView: View {
    @State var coin:CoinViewModel
    
    public var body: some View {
        HStack{
            ImageCacheView(withURL: coin.imageSmall)
                .frame(width: 40, height: 40)
                .padding(.trailing)
              
            VStack(alignment: .leading) {
                Text(coin.name)
                    .foregroundColor(.black)
                    .font(.system(size: 16, weight: .bold))
                Text("(\(coin.symbol))")
                    .foregroundColor(.black)
                    .font(.system(size: 14, weight: .light))
            }
            
            Spacer()
            
            VStack(alignment: .trailing) {
                Text(coin.price)
                    .foregroundColor(.black)
                    .font(.system(size: 16, weight: .medium))
                    .padding(.trailing)
                Text(coin.priceChangePercentage24h)
                    .foregroundColor(coin.statusColor)
                    .font(.system(size: 16, weight: .medium))
                    .padding(.trailing)
            }
        }
        .padding(12)
        .shadow(radius: 8)
    }
}

struct CoinItemView_Previews: PreviewProvider {
    static var previews: some View {
        CoinItemView(coin: mockCoinViewModel)
    }
}
