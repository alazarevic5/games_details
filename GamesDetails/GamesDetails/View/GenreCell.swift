//
//  GenreCell.swift
//  GamesDetails
//
//  Created by Aleksandra Lazarevic on 15.6.22..
//

import SwiftUI

struct GenreCell: View {
    
    @State var genre: Genre
    
    var body: some View {
        ZStack {
            Image(uiImage: (genre.getImageFromURL() ?? UIImage(named: "genrePlaceholder"))!).resizable().frame(maxWidth: 200, maxHeight: 200).aspectRatio(contentMode: .fill).overlay(Rectangle().fill(.black).opacity(0.7))
            Text(genre.name).foregroundColor(.white).font(.title2).shadow(color: .cyan, radius: 2, x: 0, y: 3)
            
        }
    }
}

struct GenreCell_Previews: PreviewProvider {
    static var previews: some View {
        GenreCell(genre: Genre(id: 1, name: "Adventure", image: "https://media.rawg.io/media/games/456/456dea5e1c7e3cd07060c14e96612001.jpg", games: []))
    }
}
