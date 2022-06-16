//
//  ContentView.swift
//  GamesDetails
//
//  Created by Aleksandra Lazarevic on 15.6.22..
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var viewModel = GenresViewModel()
    
    var body: some View {
        NavigationView {
            ZStack {
            Color(hex: "#e3edfc").edgesIgnoringSafeArea(.all)
            ScrollView {
                Divider().frame(height: 2).background(.black)
                VStack {
                    Text("Genres:").font(.title).foregroundColor(.blue).fontWeight(.bold).shadow(color: .black, radius: 15, x: 0, y: 5)
                    ScrollView (.horizontal) {
                        HStack {
                            ForEach (viewModel.genres.results) {genre in
                                GenreCell(genre: genre).frame(width: 150, height: 150).cornerRadius(10)
                            }
                            
                        }
                    }.padding()
                }
            }
            }
                .navigationTitle("Games")
                .onAppear {
                    self.viewModel.fetchGenres()
                    }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
