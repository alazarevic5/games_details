//
//  ContentView.swift
//  GamesDetails
//
//  Created by Aleksandra Lazarevic on 15.6.22..
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        NavigationView {
            ZStack {
                LinearGradient(gradient: Gradient(colors: [Color.init(hex: "#bde4ff"), Color.init(hex: "#bba9d1")]), startPoint: .top, endPoint: .bottom).edgesIgnoringSafeArea(.all)
                ScrollView {
                    Divider().frame(height: 2).background(.black)
                    VStack {
                        GenresView()
                        StoresView()
                    }
                }
            }
            .navigationTitle("Games explorer")
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
