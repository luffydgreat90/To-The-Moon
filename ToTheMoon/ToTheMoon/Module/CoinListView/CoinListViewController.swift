//
//  CoinListViewController.swift
//  ToTheMoon
//
//  Created by Marlon Ansale on 11/26/22.
//

import SwiftUI
import Combine

struct CoinListViewController: View {
    @ObservedObject var viewModel: CoinListViewModel
    var body: some View {
            ScrollView {
                LazyVStack {
                    ForEach($viewModel.coins) { coin in
                        NavigationLink {
                            CoinDetailFactory.createCoinDetailViewController(coin: coin.wrappedValue)
                        } label: {
                            CoinItemView(coin: coin.wrappedValue)
                        }
                    }
                }
                .background(Color.background)
            }
        .navigationTitle("To The Moon!")
    
    }
}

struct CoinListViewController_Previews: PreviewProvider {
    static var previews: some View {
        CoinListFactory.createCoinListMockViewController()
    }
}
