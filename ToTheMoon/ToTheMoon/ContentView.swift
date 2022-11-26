//
//  ContentView.swift
//  ToTheMoon
//
//  Created by Marlon Ansale on 11/25/22.
//

import SwiftUI
import CoreData

struct ContentView: View {

    var body: some View {
        NavigationView {
            ZStack {
                LinearGradient(gradient: Gradient(colors: [.blue, .black]),
                               startPoint: .topLeading,
                               endPoint: .bottomTrailing)
                .edgesIgnoringSafeArea(.all)
                VStack {
                    Text("To The Moon")
                        .padding(.top)
                        .font(.system(size: 17, weight: .black))
                        .foregroundColor(.white)
                    
                    Spacer()
                    
                }
                
            }
           
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
