//
//  AtheletesApp.swift
//  Atheletes
//
//  Created by Norman, ThankaVijay on 06/09/22.
//

import SwiftUI

@main
struct AtheletesApp: App {
    let viewModelFactory: ViewModelFactory = ViewModelFactory()

    var body: some Scene {
        WindowGroup {
            ContentView(vmlogin: viewModelFactory.loginViewModel(),
                        vmathlete: viewModelFactory.athletesViewModel())
        }
    }
}
