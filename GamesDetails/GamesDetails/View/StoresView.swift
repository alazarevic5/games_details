//
//  StoresView.swift
//  GamesDetails
//
//  Created by Aleksandra Lazarevic on 16.6.22..
//

import SwiftUI

struct StoresView: View {
    
    @ObservedObject var storesViewModel = StoreViewModel()
    
    var body: some View {
        Text("Stores:").font(.title).foregroundColor(Color.init(hex: "#1d2b59")).fontWeight(.bold).shadow(color: .black, radius: 15, x: 0, y: 5)
        ScrollView (.horizontal) {
            HStack {
                if storesViewModel.stores.results.count == 0 {
                    Text("Fetching stores...").fontWeight(.medium).font(.caption)
                }
                else {
                ForEach (storesViewModel.stores.results) {store in
                    Link(destination: URL(string: "http://"+store.domain)!) {
                        StoreCell(store: store)
                    }
                }
            }
            }
        }.padding()
            .onAppear {
                self.storesViewModel.fetchStores()
            }
    }
    
}

struct StoresView_Previews: PreviewProvider {
    static var previews: some View {
        StoresView()
    }
}
