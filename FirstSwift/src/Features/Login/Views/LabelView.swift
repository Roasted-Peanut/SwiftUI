//
//  LabelView.swift
//  FirstSwift
//
//  Created by PhungPV_TCOM on 06/09/2023.
//

import SwiftUI

struct LabelView: View {
    private let configurations: Configuration
    init(configurations: Configuration) {
        self.configurations = configurations
    }

    var body: some View {
        Text(configurations.title.localized)
            .font(.custom(configurations.fontType, size: CGFloat(configurations.size)))
            .foregroundColor(configurations.foregroundColor)
    }
}
