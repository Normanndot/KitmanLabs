//
//  AppColor.swift
//  Atheletes
//
//  Created by Norman, ThankaVijay on 08/09/22.
//

import SwiftUI

struct AppColor {
    static var backgroundGradient: Array<Color> {
        return [
            Color(uiColor: .systemBackground).opacity(0.0),
            Color(uiColor: .systemBackground).opacity(0.2),
            Color(uiColor: .systemBackground).opacity(0.5),
            Color(uiColor: .systemBackground).opacity(1.0),
        ]
    }
}
