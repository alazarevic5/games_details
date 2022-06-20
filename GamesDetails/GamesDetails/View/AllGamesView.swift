//
//  AllGamesView.swift
//  GamesDetails
//
//  Created by Aleksandra Lazarevic on 17.6.22..
//

import SwiftUI

struct AllGamesView: View {
    
    @State var games: [Game]
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color.init(hex: "#bde4ff"), Color.init(hex: "#bdccff")]), startPoint: .top, endPoint: .bottom).edgesIgnoringSafeArea(.all)
            ScrollView {
                VStack {
                    ForEach (games) {
                        game in
                        NavigationLink(destination: GameDetailsView(gameId: game.id)) {
                            GameRow(game: game)
                        }

                    }
                }
            }
        }
        
    }
}

struct AllGamesView_Previews: PreviewProvider {
    static var previews: some View {
        AllGamesView(games: [Game(id: 1, name: "Sims 4", description: "opis", backgroundImage: "genrePlaceholder", platforms:[PlatformInfo(platform: Platform(id: 1, name: "PC"))])])
    }
}
