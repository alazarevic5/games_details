//
//  GameRow.swift
//  GamesDetails
//
//  Created by Aleksandra Lazarevic on 17.6.22..
//

import SwiftUI

struct GameRow: View {
    @State var game: Game
    var body: some View {
        Text(game.name)
                .padding().frame(width: 350)
                .background(.thinMaterial, in: RoundedRectangle(cornerRadius: 10))
    }
}

struct GameRow_Previews: PreviewProvider {
    static var previews: some View {
        GameRow(game: Game(id: 1, name: "Proba", description: "opis", backgroundImage: "genrePlaceholder"))
    }
}
