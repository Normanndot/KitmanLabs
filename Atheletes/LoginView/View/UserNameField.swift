//
//  UserNameField.swift
//  Atheletes
//
//  Created by Norman, ThankaVijay on 07/09/22.
//

import SwiftUI

struct UserNameField: View {
    let title: String
    @Binding var text: String

    var body: some View {
        TextField(title, text: $text)
            .textFieldStyle(.roundedBorder)
            .textInputAutocapitalization(.never)
            .foregroundColor(.gray)
    }
}

//struct UserNameField_Previews: PreviewProvider {
//    static var previews: some View {
//        UserNameField(title: "Username", text: LoginView().$vm.username)
//    }
//}
