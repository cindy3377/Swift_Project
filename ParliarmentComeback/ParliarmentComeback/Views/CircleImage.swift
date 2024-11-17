//
//  CircleImage.swift
//  ParliarmentComeback
//
//  Created by Trang on 16/11/2024.
//

import SwiftUI

struct CircleImage: View {
    let imageName: String

    var body: some View {
        Image(imageName)
            .resizable()
            .scaledToFill()
            .frame(width: 200, height: 200)
            .clipShape(Circle())
            .overlay {
                Circle().stroke(Color.white, lineWidth: 4)
            }
            .shadow(radius: 7)
    }
}

#Preview {
    CircleImage(imageName: "defaultImage")
}
