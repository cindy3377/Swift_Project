//
//  PartyItem.swift
//  ParliarmentComeback
//
//  Created by Trang on 16/11/2024.
//

import SwiftUI

struct PartyItem: View {
    var member: Member

    var body: some View {
        VStack(alignment: .leading) {
            Image(member.partyImageName())
                .resizable()
                .frame(width: 155, height: 155)
                .cornerRadius(5)
            Text("\(member.first) \(member.last)")
                .foregroundStyle(.primary)
                .font(.caption)
        }
        .padding(.leading, 15)
    }
}

#Preview {
    PartyItem(member: ModelData().members[0])
}
