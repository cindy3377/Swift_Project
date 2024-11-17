//
//  Color+Extensions.swift
//  ParliarmentComeback
//
//  Created by Trang on 16/11/2024.
//

import SwiftUI

// This is the Color extension to map party names to specific colors
extension Color {
    // Dictionary to map party names to colors
    static let partyColors: [String: Color] = [
        "ps": .blue,
        "kesk": .green,
        "kok": .orange,
        "sd": .red,
        "liik": .yellow,
        "r": .purple,
        "vas": .pink,
        "vihr": .mint,
        "kd": .gray
    ]

    // Function to get a color based on party name
    static func color(for party: String) -> Color {
        return partyColors[party] ?? .gray // Default to gray if no match found
    }
}
