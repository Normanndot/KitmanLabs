//
//  AtheleteCardView.swift
//  Atheletes
//
//  Created by Norman, ThankaVijay on 07/09/22.
//

import SwiftUI

struct AtheleteCardView: View {
    var model: AthleteModel

    var body: some View {
        AthleteProfilePic(profilePic: model.profileImage)
            .overlay {
                VStack(alignment: .leading) {
                    Spacer()
                    Text(model.name)
                        .foregroundColor(.white)
                        .fontWeight(.bold)
                        .font(.largeTitle)
                    Text(model.squad)
                        .foregroundColor(.white)
                        .fontWeight(.medium)
                        .font(.title)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
            }
    }
}

struct AtheleteCardView_Previews: PreviewProvider {
    static var previews: some View {
        AtheleteCardView(model: AthleteModel(name: "Norman D", id: 12, squad: "Staff, Roaster club", profileImage: "https://kitman.imgix.net/avatar.jpg"))
            .previewLayout(.sizeThatFits)
    }
}
