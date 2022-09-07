//
//  AthletesView.swift
//  Atheletes
//
//  Created by Norman, ThankaVijay on 07/09/22.
//

import SwiftUI

struct AthletesView: View {
    var columns: [GridItem] = [.init(spacing: 5)]
    let detail = AthleteDetail(firstName: "Norman",
                                lastName: "D",
                                id: 1964,
                                image: AtheleteImage(url: ""),
                                username: "normanndot",
                                squadIDS: [78,225])

    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns, spacing: 15) {
                ForEach(0..<6) { index in
                    AtheleteCardView(detail: detail)
                }
            }
            .padding(15)
        }
    }
}

struct AthletesView_Previews: PreviewProvider {
    static var previews: some View {
        AthletesView()
    }
}
