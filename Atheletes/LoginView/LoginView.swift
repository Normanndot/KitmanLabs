//
//  LoginView.swift
//  Atheletes
//
//  Created by Norman, ThankaVijay on 06/09/22.
//

import SwiftUI

struct LoginView: View {
    let submitLogin: (String, String) -> ()
    @State private var userName: String = ""
    @State private var password: String = ""
    @Binding var errorMessage: String?

    var body: some View {
        ZStack {
            Image("login-bg")
                .scaledToFit()
                .cornerRadius(20)
                .ignoresSafeArea()
                .overlay {
                    LinearGradient(gradient: Gradient(colors: AppColor.backgroundGradient), startPoint: .top, endPoint: .bottom)
                }

            VStack(alignment: .leading, spacing: 20) {
                Spacer()
                Spacer()
                UserNameField(title: "Username", text: $userName)
                PasswordField(title: "Password", text: $password)
                if let error = errorMessage {
                    Text(error)
                        .foregroundColor(.red)
                }
                LoginButton {
                    Task {
                        submitLogin(userName, password)
                    }
                }
                Spacer()
            }
            .frame(width: 300)
            .padding()
        }
        .transition(.offset(x: 0, y: 850))
    }
}


//struct LoginView_Previews: PreviewProvider {
//    static var previews: some View {
//        Group {
//            LoginView()
//        }
//    }
//}
