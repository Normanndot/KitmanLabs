//
//  ContentView.swift
//  Atheletes
//
//  Created by Norman, ThankaVijay on 06/09/22.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var vmlogin: LoginViewModel
    @ObservedObject var vmathlete: AthletesViewModel

    @EnvironmentObject var appState: Appstate

    var body: some View {
        if vmlogin.sessionID == nil {
            LoginView(submitLogin: { username, password in
                Task {
                    await vmlogin.login(userName: username, password: password)
                }
            }, errorMessage: $vmlogin.errorMessage)
        } else {
            AthletesView(columns: [.init(spacing: 5)], vm: vmathlete)
        }
    }
}

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView().preferredColorScheme(.dark)
//    }
//}
