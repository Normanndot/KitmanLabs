//
//  ContentView.swift
//  Atheletes
//
//  Created by Norman, ThankaVijay on 06/09/22.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var vm: LoginViewModel
    @EnvironmentObject var appState: Appstate

    var body: some View {
        if vm.sessionID == nil {
            LoginView(submitLogin: { username, password in
                Task {
                    await vm.login(userName: username, password: password)
                }
            }, errorMessage: $vm.errorMessage)
        } else {
            AthletesView()
        }
    }
}

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView().preferredColorScheme(.dark)
//    }
//}
