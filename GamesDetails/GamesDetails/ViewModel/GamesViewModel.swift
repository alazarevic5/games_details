//
//  GamesViewModel.swift
//  GamesDetails
//
//  Created by Aleksandra Lazarevic on 20.6.22..
//

import Foundation
import Combine

class GamesViewModel: ObservableObject {
    
    // https://api.rawg.io/api/games/3498?key=c0ec8feacda2430380c08be8cba29218
    
    private let key = "c0ec8feacda2430380c08be8cba29218"
    private let baseURL = "https://api.rawg.io/api/games/"
    
    private var task: AnyCancellable?
    
    @Published var game: Game  = Game(id: 1, name: "---")
    
    func fetchGameInfo(id: Int) {
        let fullURL = baseURL + String(id) + "?key=\(key)"
        task = URLSession.shared.dataTaskPublisher(for: URL(string: fullURL)!)
            .map { $0.data }
            .decode(type: Game.self, decoder: JSONDecoder())
            .replaceError(with: Game(id: 1, name: "---"))
            .eraseToAnyPublisher()
            .receive(on: RunLoop.main)
            .assign(to: \GamesViewModel.game, on: self)
        print(fullURL)
        print(self.game.name)
    }
}
