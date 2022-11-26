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
        VStack{
            Text("To The Moon!")
                .font(.system(size: 24, weight: .bold))
            List($viewModel.coins) { coin in
                NavigationLink {
                    CoinDetailViewController()
                } label: {
                    CoinItemView(coin: coin.wrappedValue)
                                .listRowInsets(.init(top: 8, leading: 16, bottom: 8, trailing: 16))
                               
                }.listRowSeparator(.hidden)
            }
            .listStyle(.plain)
            .background(.clear)
            .edgesIgnoringSafeArea(.all)
        }.onAppear()
    }
}

struct CoinListViewController_Previews: PreviewProvider {
    static var previews: some View {
        CoinListFactory.createCoinListMockViewController()
    }
}
