//
//  MemberList.swift
//  ParliarmentComeback
//
//  Created by Trang on 16/11/2024.
//

import SwiftUI

struct MemberList: View {
    @Environment(ModelData.self) var modelData
    @EnvironmentObject var favoriteManager: FavoriteManager
    @State private var showOnlyFavorites = false

    private var filteredMembers: [Member] {
        showOnlyFavorites ? modelData.members.filter(favoriteManager.isFavorite) : modelData.members
    }

    var body: some View {
        NavigationView {
            List(filteredMembers) { member in
                NavigationLink(destination: MemberDetail(member: member)) {
                    MemberRow(member: member)
                }
            }
            .navigationTitle("All Members")
            .toolbar {
                ToolbarItem {
                    Toggle("Favorites Only", isOn: $showOnlyFavorites)
                }
            }
        }
    }
}

#Preview {
    MemberList()
        .environment(ModelData())
        .environmentObject(FavoriteManager())
}
