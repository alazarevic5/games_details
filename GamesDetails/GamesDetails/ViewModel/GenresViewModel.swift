//
//  GenresViewModel.swift
//  GamesDetails
//
//  Created by Aleksandra Lazarevic on 16.6.22..
//

import Foundation
import Combine

class GenresViewModel: ObservableObject {
    
    private let url = "https://api.rawg.io/api/genres?key=c0ec8feacda2430380c08be8cba29218"
    
    private var task: AnyCancellable?
    
    @Published var genres = AllGenres(results: [Genre]())
    
    func fetchGenres() {
        task = URLSession.shared.dataTaskPublisher(for: URL(string: url)!)
            .map { $0.data }
            .decode(type: AllGenres.self, decoder: JSONDecoder())
            .replaceError(with: AllGenres.self.init(results: []))
            .eraseToAnyPublisher()
            .receive(on: RunLoop.main)
            .assign(to: \GenresViewModel.genres, on: self)
        
        print(self.genres)
    }
}
