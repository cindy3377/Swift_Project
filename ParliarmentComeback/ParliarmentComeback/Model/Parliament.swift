//
//  Parliament.swift
//  ParliarmentComeback
//
//  Created by Trang on 16/11/2024.
//

import Foundation

// Member struct with data
struct Member: Codable, Identifiable {
    var id: Int { personNumber }
    let personNumber: Int
    let seatNumber: Int
    let last: String
    let first: String
    let party: String
    let minister: Bool
    let picture: String
    let twitter: String
    let bornYear: Int
    let constituency: String

    // Helper to determine party image name
    func partyImageName() -> String {
        switch party {
        case "ps": return "ps"
        case "kesk": return "kesk"
        case "kok": return "kok"
        case "sd": return "sd"
        case "vihr": return "vihr"
        case "vas": return "vas"
        case "r": return "r"
        case "kd": return "kd"
        case "liik": return "liik"
        case "lib": return "lib"
        case "feminist": return "feminist"
        default: return "defaultImage"
        }
    }
}
