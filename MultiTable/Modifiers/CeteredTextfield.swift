//
//  CeteredTextfield.swift
//  MultiTable
//
//  Created by Artem Usachov on 12.05.2021.
//

import SwiftUI

struct RoundedCenteredTextfieldModifier: ViewModifier {
    
    let keyboardType: UIKeyboardType
    
    func body(content: Content) -> some View {
        content
            .multilineTextAlignment(.center)
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .keyboardType(keyboardType)
    }
}

extension View {
    func roundedCenteredTextfield(keyboardType: UIKeyboardType) -> some View {
        self.modifier(RoundedCenteredTextfieldModifier(keyboardType: keyboardType))
    }
}
