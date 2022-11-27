//
//  CoinDetailViewController.swift
//  ToTheMoon
//
//  Created by Marlon Ansale on 11/26/22.
//

import SwiftUI

struct CoinDetailViewController: View {
    @ObservedObject var viewModel: CoinDetailViewModel
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                ImageCacheView(withURL: viewModel.coin.image)
                    .frame(width: 100, height: 100)
                    .padding()
                    .shadow(radius: 8.0)
                VStack(alignment: .leading) {
                    Text(viewModel.coin.name + " (\(viewModel.coin.symbol.uppercased()))")
                        .multilineTextAlignment(.leading)
                        .font(.system(size: 24, weight: .medium))
                    Text(String(viewModel.coin.price))
                        .multilineTextAlignment(.leading)
                        .font(.system(size: 32, weight: .black))
                }
            }
            
            HStack {
                VStack(alignment: .leading) {
                    Text("Low 24h")
                        .font(.system(size: 24, weight: .black))
                        .foregroundColor(.red)
                    Text(viewModel.coin.low24h)
                        .font(.system(size: 24, weight: .bold))
                        
                }.frame(maxWidth: .infinity)
                
                VStack(alignment: .leading) {
                    Text("High 24h")
                        .font(.system(size: 24, weight: .black))
                        .foregroundColor(.green)
                    Text(viewModel.coin.high24h)
                        .font(.system(size: 24, weight: .bold))
                        
                }.frame(maxWidth: .infinity)
            
                
            }
            .frame(maxWidth: .infinity)
            .padding()
            Spacer()
        }
        
        .navigationTitle(viewModel.coin.marketCapRank)
        .navigationBarTitleDisplayMode(.inline)
            
    }
}

struct CoinDetailViewController_Previews: PreviewProvider {
    static var previews: some View {
        CoinDetailFactory.createMockCoinDetailViewController()
    }
}
