//
//  AtheleteCardView.swift
//  Atheletes
//
//  Created by Norman, ThankaVijay on 07/09/22.
//

import SwiftUI

struct AtheleteCardView: View {
    var detail: AthleteDetail

    var body: some View {
        Image("login-bg")
            .resizable()
            .scaledToFit()
            .cornerRadius(20)
            .onTapGesture {
                print("tap press")
            }
            .overlay {
                VStack(alignment: .leading) {
                    Spacer()
                    Text(detail.firstName + " " + detail.lastName)
                        .foregroundColor(.white)
                        .fontWeight(.bold)
                        .font(.largeTitle)
                    Text("Staff, Active Roaster")
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
        AtheleteCardView(detail:
                            AthleteDetail(firstName: "Norman",
                                           lastName: "D",
                                           id: 1964,
                                           image: AtheleteImage(url: ""),
                                           username: "normanndot",
                                           squadIDS: [78,225]))
        .previewLayout(.sizeThatFits)
    }
}
