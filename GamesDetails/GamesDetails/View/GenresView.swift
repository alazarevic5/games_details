//
//  GenresView.swift
//  GamesDetails
//
//  Created by Aleksandra Lazarevic on 16.6.22..
//

import SwiftUI

struct GenresView: View {
    
    @ObservedObject var genresViewModel = GenresViewModel()
    
    var body: some View {
        
            Text("Genres:").font(.title).foregroundColor(Color.init(hex: "#1d2b59")).fontWeight(.bold).shadow(color: .black, radius: 15, x: 0, y: 5)
            ScrollView (.horizontal) {
                HStack {
                    ForEach (genresViewModel.genres.results) {genre in
                            GenreCell(genre: genre).frame(width: 150, height: 150).cornerRadius(10)
                    }
                    
                }
            }.padding()
            .onAppear {
                self.genresViewModel.fetchGenres()
            }
    }
}

struct GenresView_Previews: PreviewProvider {
    static var previews: some View {
        GenresView()
    }
}
