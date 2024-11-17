//
//  ModelData.swift
//  ParliarmentComeback
//
//  Created by Trang on 16/11/2024.
//

import Foundation

@Observable
class ModelData {
    var members: [Member]

    // Filtered list of favorite members
    var favoriteMembers: [Member] {
        members.filter(FavoriteManager().isFavorite)
    }
    
    // Members grouped by party
    var membersByParty: [String: [Member]] {
        Dictionary(grouping: members, by: \.party)
    }
    
    // Initializer
    init() {
        // Load the members when the instance is initialized
        self.members = Self.load("mps.json")
    }
    
    // Generic JSON data loader
    private static func load<T: Decodable>(_ filename: String) -> T {
        guard let fileURL = Bundle.main.url(forResource: filename, withExtension: nil) else {
            fatalError("Couldn't find \(filename) in the main bundle.")
        }
        do {
            let data = try Data(contentsOf: fileURL)
            return try JSONDecoder().decode(T.self, from: data)
        } catch {
            fatalError("Failed to load \(filename): \(error)")
        }
    }
}
