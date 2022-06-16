//
//  Genre.swift
//  GamesDetails
//
//  Created by Aleksandra Lazarevic on 15.6.22..
//

import Foundation
import UIKit

struct AllGenres: Codable {
    var results: [Genre]
}

struct Genre: Codable, Identifiable {
    var id: Int
    var name: String
    var image: String
    var games: [Game]
    
    func getImageFromURL() -> UIImage? {
        guard let url = URL(string: self.image) else {
            return nil
        }
        guard let data = try? Data(contentsOf: url) else {
            return nil
        }
        return UIImage(data: data)
    }
    
    private enum CodingKeys : String, CodingKey {
        case id
        case name
        case image = "image_background"
        case games
    }
}
