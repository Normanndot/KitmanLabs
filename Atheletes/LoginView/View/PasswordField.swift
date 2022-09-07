//
//  PasswordField.swift
//  Atheletes
//
//  Created by Norman, ThankaVijay on 06/09/22.
//

import SwiftUI

struct PasswordField: View {
    let title: String
    @Binding var text: String
    @State private var passwordHidden = true

    var body: some View {
        ZStack(alignment: .trailing) {
            if passwordHidden {
                SecureField(title, text: $text)
                    .textInputAutocapitalization(.never)
                    .privacySensitive()
            } else {
                TextField(title, text: $text)
                    .disableAutocorrection(true)
            }

            Button {
                passwordHidden.toggle()
            } label: {
                Image(systemName: passwordHidden ? "eye.slash" : "eye")
            }
            .foregroundColor(.primary)
        }
        .textFieldStyle(.roundedBorder)

    }
}

//struct PasswordField_Previews: PreviewProvider {
//    static var previews: some View {
//        PasswordField(title: "Password", text: LoginView().$vm.password)
//    }
//}
