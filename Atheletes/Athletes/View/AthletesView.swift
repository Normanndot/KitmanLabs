//
//  AthletesView.swift
//  Atheletes
//
//  Created by Norman, ThankaVijay on 07/09/22.
//

import SwiftUI

struct AthletesView: View {
    var columns: [GridItem]
    @ObservedObject var vm: AthletesViewModel

    var body: some View {
        if vm.athlete == nil {
            ProgressView()
                .onAppear {
                    Task {
                        await vm.fetchAthleteList()
                    }
                }
        } else {
            ScrollView {
                LazyVGrid(columns: columns, spacing: 15) {
                    ForEach(vm.athlete!) { athlete in
                        AtheleteCardView(model: athlete)
                    }
                }
                .padding(15)
            }
        }
    }
}

//struct AthletesView_Previews: PreviewProvider {
//    static var previews: some View {
//        AthletesView()
//    }
//}
