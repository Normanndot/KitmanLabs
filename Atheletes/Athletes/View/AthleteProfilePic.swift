//
//  AthleteProfilePic.swift
//  Atheletes
//
//  Created by Norman, ThankaVijay on 08/09/22.
//

import SwiftUI

struct AthleteProfilePic: View {
    var profilePic: String
    
    var body: some View {
        if let url = URL(string: profilePic) {
            AsyncImage(url: url) { phase in
                switch phase {
                case .empty:
                    ProgressView()
                case .success(let image):
                    image.resizable()
                case .failure:
                    Image("placeholder")
                        .resizable()
                @unknown default:
                    // Since the AsyncImagePhase enum isn't frozen,
                    // we need to add this currently unused fallback
                    // to handle any new cases that might be added
                    // in the future:
                    EmptyView()
                }
            }
            .aspectRatio(contentMode: .fill)
            .cornerRadius(20)
        } else {
            EmptyView()
        }
    }
}

struct AthleteProfilePic_Previews: PreviewProvider {
    static var previews: some View {
        AthleteProfilePic(profilePic: "https://kitman.imgix.net/avatar.jpg")
    }
}
