//
//  FavoriteManager.swift
//  ParliarmentComeback
//
//  Created by Trang on 16/11/2024.
//

import Foundation
import SwiftUI

class FavoriteManager: ObservableObject {
    @AppStorage("favoriteMemberIDs") private var favoriteMemberIDsString: String = "[]"
    
    private var favoriteMemberIDs: [Int] {
        get {
            guard let data = favoriteMemberIDsString.data(using: .utf8) else { return [] }
            return (try? JSONDecoder().decode([Int].self, from: data)) ?? []
        }
        set {
            if let data = try? JSONEncoder().encode(newValue),
               let jsonString = String(data: data, encoding: .utf8) {
                favoriteMemberIDsString = jsonString
            }
        }
    }

    func isFavorite(member: Member) -> Bool {
        favoriteMemberIDs.contains(member.id)
    }

    func toggleFavorite(for member: Member) {
        var favorites = favoriteMemberIDs
        if isFavorite(member: member) {
            favorites.removeAll { $0 == member.id }
        } else {
            favorites.append(member.id)
        }
        favoriteMemberIDs = favorites
    }
}

