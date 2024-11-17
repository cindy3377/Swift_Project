//
//  PartyHome.swift
//  ParliarmentComeback
//
//  Created by Trang on 16/11/2024.
//

import SwiftUI

struct PartyHome: View {
    @Environment(ModelData.self) var modelData

    var body: some View {
        NavigationSplitView {
            List {
                if let firstMember = modelData.members.first {
                    Image(firstMember.constituency)
                        .resizable()
                        .scaledToFill()
                        .frame(height: 200)
                        .clipped()
                        .listRowInsets(EdgeInsets())
                }

                ForEach(modelData.membersByParty.keys.sorted(), id: \.self) { partyName in
                    PartyRow(partyName: partyName, members: modelData.membersByParty[partyName]!)
                }
                .listRowInsets(EdgeInsets())
            }
            .navigationTitle("Featured")
        } detail: {
            Text("Select a Member")
        }
    }
}

#Preview {
    PartyHome()
        .environment(ModelData())
}
