//
//  StoreViewModel.swift
//  GamesDetails
//
//  Created by Aleksandra Lazarevic on 16.6.22..
//

import Foundation
import Combine

class StoreViewModel: ObservableObject {
    
    private let url = "https://api.rawg.io/api/stores?key=\(Config.apiKey)"
    
    private var task: AnyCancellable?
    
    @Published var stores = AllStores(results: [Store]())
    
    func fetchStores() {
        task = URLSession.shared.dataTaskPublisher(for: URL(string: url)!)
            .map { $0.data }
            .decode(type: AllStores.self, decoder: JSONDecoder())
            .replaceError(with: AllStores.self.init(results: []))
            .eraseToAnyPublisher()
            .receive(on: RunLoop.main)
            .assign(to: \StoreViewModel.stores, on: self)
        
    }
}
