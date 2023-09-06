//
//  ButtonCustom.swift
//  FirstSwift
//
//  Created by PhungPV_TCOM on 06/09/2023.
//

import SwiftUI

struct ButtonCustom: View {
    private let buttonModel: ButtonModel
    private var handle: (() -> Void)
    init(buttonModel: ButtonModel, action: @escaping (() -> Void) ) {
        self.buttonModel = buttonModel
        self.handle = action
    }
    
    var body: some View {
        Button(
            
            action: handle,
            label: {
                Image(buttonModel.imageName)
                    .resizable()
                    .frame(width: 24, height: 24)
                    .padding(.horizontal, 5)
                Text(buttonModel.title.localized)
                    .font(.custom(buttonModel.fontType, size: CGFloat(buttonModel.fontSize)))
                    .foregroundColor(buttonModel.foregroundColor)
            }
        )
        .frame(maxWidth: .infinity, minHeight: 42)
        .overlay(
            RoundedRectangle(cornerRadius: 50)
                .stroke(Color.white, lineWidth: 1)
        )
    }
}
