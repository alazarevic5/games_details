//
//  GameDetailsView.swift
//  GamesDetails
//
//  Created by Aleksandra Lazarevic on 20.6.22..
//

import SwiftUI
import WebKit

struct GameDetailsView: View {
    
    @State var gameId: Int
    @ObservedObject var gamesViewModel = GamesViewModel()

    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color.init(hex: "#bde4ff"), Color.init(hex: "#bdccff")]), startPoint: .top, endPoint: .bottom).edgesIgnoringSafeArea(.all)
            ScrollView {
                VStack {
                    Text(gamesViewModel.game.name).font(.title).foregroundColor(Color.init(hex: "#1d2b59")).fontWeight(.bold).shadow(color: .black, radius: 15, x: 0, y: 5).padding(EdgeInsets(top: 20, leading: 0, bottom: 0, trailing: 0))
                    Image(uiImage: (gamesViewModel.game.getImageFromURL() ?? UIImage(named: "genrePlaceholder"))!).resizable().frame(height: 300).aspectRatio(contentMode: .fit).cornerRadius(20).padding()

                    Text(gamesViewModel.game.description ?? "").padding(EdgeInsets(top: 20, leading: 20, bottom: 20, trailing: 20)).background(.thinMaterial, in: RoundedRectangle(cornerRadius: 10)).padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20)).animation(.linear)
                    
    
                }
            }
        }
        .navigationTitle("Details").navigationBarTitleDisplayMode(.inline)
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

