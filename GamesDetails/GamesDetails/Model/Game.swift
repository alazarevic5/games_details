//
//  Game.swift
//  GamesDetails
//
//  Created by Aleksandra Lazarevic on 15.6.22..
//

import Foundation

struct Platform: Codable, Identifiable {
    var id: Int
    var name: String
}

struct PlatformInfo: Codable {
    var platform: Platform
}

struct Game: Codable, Identifiable {
    var id: Int
    var name: String
    var description: String?
    var backgroundImage: String?
    var platforms: [PlatformInfo]?
    
    private enum CodingKeys : String, CodingKey {
        case id
        case name
        case description
        case backgroundImage = "background_image"
        case platforms
    }
}
