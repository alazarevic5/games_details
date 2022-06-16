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
            ScrollView {
                VStack {
                    ScrollView (.horizontal) {
                        HStack {
                            GenreCell(genre: Genre(id: 1, name: "Adventure", image: "https://media.rawg.io/media/games/456/456dea5e1c7e3cd07060c14e96612001.jpg", games: [])).frame(width: 150, height: 150).cornerRadius(10)
                        }
                    }.padding()
                }
            }
                .navigationTitle("Games")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
