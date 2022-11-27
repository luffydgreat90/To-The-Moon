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
        VStack {
            Text(viewModel.coin.marketCapRank)
                .font(.system(size: 32, weight: .black))
            HStack {
                ImageCacheView(withURL: viewModel.coin.image)
                    .frame(width: 100, height: 100)
                    .padding()
                VStack(alignment: .leading) {
                    Text(viewModel.coin.name)
                        .multilineTextAlignment(.leading)
                        .font(.largeTitle)
                    Text(String(viewModel.coin.price))
                        .multilineTextAlignment(.leading)
                        .font(.system(size: 32, weight: .black))
                        
                }
                
                Spacer()
            }
           
            
            Spacer()
        }
    }
}

struct CoinDetailViewController_Previews: PreviewProvider {
    static var previews: some View {
        CoinDetailFactory.createMockCoinDetailViewController()
    }
}
