//
//  SecureFieldCustom.swift
//  FirstSwift
//
//  Created by TCOM on 06/09/2023.
//

import SwiftUI

struct SecureFieldCustom: View {
    private let textFieldModels: TextFieldModel
    @Binding var field: String
    init(textFieldModels: TextFieldModel, field: Binding<String>) {
        self.textFieldModels = textFieldModels
        self._field = field
    }

    var body: some View {
        SecureField(
            textFieldModels.placeholder.localized,
            text: $field
        )
        .font(.custom(.bold, size: 14))
        .padding()
        .frame(height: 42)
        .autocapitalization(.none)
        .disableAutocorrection(true)
        .background(RoundedRectangle(cornerRadius: 24).fill(Color.white))
    }
}
