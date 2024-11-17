//
//  PartyRow.swift
//  ParliarmentComeback
//
//  Created by Trang on 16/11/2024.
//

import Foundation

import SwiftUI

struct PartyRow: View {
    var partyName: String
    var members: [Member]

    var body: some View {
        VStack(alignment: .leading) {
            Text(partyName.uppercased())
                .font(.headline)
                .padding(.leading, 15)
                .padding(.top, 5)

            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .top, spacing: 0) {
                    ForEach(members) { member in
                        NavigationLink {
                            MemberDetail(member: member)
                        } label: {
                            PartyItem(member: member)
                        }
                    }
                }
            }
            .frame(height: 185)
        }
    }
}

#Preview {
    let modelData = ModelData()
    return PartyRow(
        partyName: "Sample Party",
        members: Array(modelData.members.prefix(4))
    )
}
