//
//  PreferencesView.swift
//  ParliarmentComeback
//
//  Created by Trang on 16/11/2024.
//

import SwiftUI

struct PreferencesView: View {
    @EnvironmentObject var memberData: MemberData
    @State private var selectedParties: Set<String> = []
    @State private var selectedMPs: Set<Int> = []
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Select Favorite Parties")) {
                    ForEach(memberData.membersByParty.keys.sorted(), id: \.self) { party in
                        Toggle(party.uppercased(), isOn: Binding(
                            get: { selectedParties.contains(party) },
                            set: { newValue in
                                if newValue {
                                    selectedParties.insert(party)
                                } else {
                                    selectedParties.remove(party)
                                }
                            }
                        ))
                    }
                }
                
                Section(header: Text("Select Favorite Members")) {
                    ForEach(memberData.members) { member in
                        Toggle("\(member.first) \(member.last)", isOn: Binding(
                            get: { selectedMPs.contains(member.id) },
                            set: { newValue in
                                if newValue {
                                    selectedMPs.insert(member.id)
                                } else {
                                    selectedMPs.remove(member.id)
                                }
                            }
                        ))
                    }
                }
                
                Button("Save Preferences") {
                    // Save selected preferences, e.g., to UserDefaults or a backend.
                    print("Selected parties: \(selectedParties)")
                    print("Selected MPs: \(selectedMPs)")
                }
            }
            .navigationTitle("Preferences")
        }
    }
}

#Preview {
    PreferencesView()
        .environmentObject(MemberData())
}
