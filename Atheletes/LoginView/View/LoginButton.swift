//
//  LoginButton.swift
//  Atheletes
//
//  Created by Norman, ThankaVijay on 08/09/22.
//

import SwiftUI

struct LoginButton: View {
    @Environment(\.colorScheme) private var colorSheme
    let action: () -> Void

    var body: some View {
        HStack {
            Spacer()
            Button("Log in", role: .cancel, action: {
                Task {
                    action()
                }
            })
            .foregroundColor(colorSheme == .dark ? .black : .white)
            .font(.system(size: 20, weight: .medium, design: .rounded))
            .padding()
            .background(.primary)
            .buttonBorderShape(.roundedRectangle)
            .border(.white, width: 1.0)
            .cornerRadius(15)
            .frame(width: 90)
        }
    }
}

struct LoginButton_Previews: PreviewProvider {
    static var previews: some View {
        LoginButton {
            
        }
    }
}
