//
//  MemberRow.swift
//  ParliarmentComeback
//
//  Created by Trang on 16/11/2024.
//

import SwiftUI

struct MemberRow: View {
    let member: Member
    @EnvironmentObject var favoriteManager: FavoriteManager

    private var isFavorite: Bool {
        favoriteManager.isFavorite(member: member)
    }

    var body: some View {
        HStack {
            Image(member.partyImageName())
                .resizable()
                .scaledToFill()
                .frame(width: 50, height: 50)
                .clipShape(Circle())
            
            VStack(alignment: .leading) {
                Text("\(member.first) \(member.last)").font(.headline)
                Text("\(member.constituency) • \(member.party.uppercased())")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
            
            Spacer()
            
            Button(action: { favoriteManager.toggleFavorite(for: member) }) {
                Image(systemName: isFavorite ? "heart.fill" : "heart")
                    .foregroundColor(isFavorite ? .red : .gray)
            }
            .buttonStyle(PlainButtonStyle())
        }
        .padding(.vertical, 5)
    }
}

#Preview {
    MemberRow(member: ModelData().members.first!)
        .environmentObject(FavoriteManager())
}
