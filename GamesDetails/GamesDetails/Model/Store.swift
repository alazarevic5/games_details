//
//  Store.swift
//  GamesDetails
//
//  Created by Aleksandra Lazarevic on 16.6.22..
//

import Foundation
import UIKit

struct AllStores: Codable {
    var results: [Store]
}

struct Store: Codable, Identifiable {
    var id: Int
    var name: String
    var domain: String
    var image: String
    
    
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
        case domain
        case image = "image_background"
    }
}
