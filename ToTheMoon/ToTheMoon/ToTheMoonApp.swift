//
//  ToTheMoonApp.swift
//  ToTheMoon
//
//  Created by Marlon Ansale on 11/25/22.
//

import SwiftUI

@main
struct ToTheMoonApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            NavigationView {
                CoinListFactory.createCoinListMockViewController()
                    .environment(\.managedObjectContext, persistenceController.container.viewContext)
            }
        }
    }
}
