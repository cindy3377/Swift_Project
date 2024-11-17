//
//  MemberData.swift
//  ParliarmentComeback
//
//  Created by Trang on 16/11/2024.
//

import SwiftUI
import Combine

class MemberData: ObservableObject {
    @Published var members: [Member] = []
    @Published var membersByParty: [String: [Member]] = [:]
    
    private let url = URL(string: "https://users.metropolia.fi/~peterh/mps.json")!

    init() {
        fetchMembers()
    }

    func fetchMembers() {
        URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
            if let error = error {
                print("Error fetching members: \(error)")
                return
            }

            guard let data = data else {
                print("No data received from the server.")
                return
            }

            do {
                let decoder = JSONDecoder()
                let fetchedMembers = try decoder.decode([Member].self, from: data)

                DispatchQueue.main.async {
                    self?.members = fetchedMembers
                    self?.groupMembersByParty()
                }
            } catch {
                print("Error decoding members: \(error)")
            }
        }.resume()
    }

    private func groupMembersByParty() {
        membersByParty = Dictionary(grouping: members, by: { $0.party })
    }
}
