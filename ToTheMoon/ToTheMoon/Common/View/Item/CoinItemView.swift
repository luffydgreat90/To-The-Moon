//
//  CoinItemView.swift
//  ToTheMoon
//
//  Created by Marlon Ansale on 11/26/22.
//

import SwiftUI

public struct CoinItemView: View {
    let coin:Coin
    
    public var body: some View {
        HStack{
            Image(systemName: "bitcoinsign")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40.0, height: 40.0)
                .padding(.all)
            Text(coin.name)
                .font(.system(size: 16, weight: .bold))
            Text(coin.id)
                .font(.system(size: 14, weight: .light))
            Spacer()
            Text(String(coin.currentPrice))
                .font(.system(size: 16, weight: .medium))
                .padding(.trailing)
            
        }
        .overlay{
            RoundedRectangle(cornerSize: CGSize(width: 8, height: 8)).stroke(.black, lineWidth: 4)
        }
        .shadow(radius: 8)
        .background(.white)
    }
}

struct CoinItemView_Previews: PreviewProvider {
    static var previews: some View {
        CoinItemView(coin: Coin(id: "BTC", symbol: "B", name: "Bitcoin", image: URL(string: "test")!, currentPrice: 222.22, lastUpdated: Date()))
    }
}
