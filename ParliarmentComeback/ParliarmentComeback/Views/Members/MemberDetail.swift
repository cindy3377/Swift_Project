//
//  MemberDetail.swift
//  ParliarmentComeback
//
//  Created by Trang on 16/11/2024.
//

import SwiftUI

struct MemberDetail: View {
    let member: Member
    @EnvironmentObject var favoriteManager: FavoriteManager

    var body: some View {
        ScrollView {
            VStack {
                Image(member.partyImageName())
                    .resizable()
                    .scaledToFill()
                    .frame(height: 100)
                    .clipped()
                
                CircleImage(imageName: member.partyImageName())
                    .offset(y: -130)
                    .padding(.bottom, -130)
                
                VStack(alignment: .leading) {
                    Text("\(member.first) \(member.last)").font(.title)
                    
                    HStack {
                        Text(member.constituency).font(.subheadline)
                        Spacer()
                        Text(member.party.uppercased())
                            .foregroundColor(.secondary)
                            .font(.subheadline)
                    }
                    
                    Divider()
                    
                    Text("About \(member.first)").font(.title2)
                    Text("Seat Number: \(member.seatNumber)")
                    Text("Minister: \(member.minister ? "Yes" : "No")")
                    Text("Born Year: \(member.bornYear)")
                    
                    if !member.twitter.isEmpty {
                        Link("Twitter: \(member.twitter)", destination: URL(string: member.twitter)!)
                            .foregroundColor(.blue)
                    }
                    
                    Button(action: { favoriteManager.toggleFavorite(for: member) }) {
                        Label(favoriteManager.isFavorite(member: member) ? "Remove from Favorites" : "Add to Favorites",
                              systemImage: favoriteManager.isFavorite(member: member) ? "heart.fill" : "heart")
                            .padding()
                            .background(RoundedRectangle(cornerRadius: 10)
                            .stroke(favoriteManager.isFavorite(member: member) ? Color.red : .gray))
                    }
                }
                .padding()
            }
        }
        .navigationTitle("\(member.first) \(member.last)")
    }
}

#Preview {
    MemberDetail(member: ModelData().members.first!)
        .environmentObject(FavoriteManager())
}
