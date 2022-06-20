//
//  GameDetailsView.swift
//  GamesDetails
//
//  Created by Aleksandra Lazarevic on 20.6.22..
//

import SwiftUI

struct GameDetailsView: View {
    
    @State var gameId: Int
    @ObservedObject var gamesViewModel = GamesViewModel()

    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color.init(hex: "#bde4ff"), Color.init(hex: "#bdccff")]), startPoint: .top, endPoint: .bottom).edgesIgnoringSafeArea(.all)
            ScrollView {
                VStack {
                    Text(gamesViewModel.game.name)
                }
            }
        }
        .navigationTitle("Game Details")
        .onAppear {
            self.gamesViewModel.fetchGameInfo(id: gameId)
        }
    }
}

struct GameDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        GameDetailsView(gameId: 3498)
    }
}
