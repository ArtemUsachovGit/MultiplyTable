//
//  RotateSpringModifier.swift
//  MultiTable
//
//  Created by Artem Usachov on 12.05.2021.
//

import SwiftUI

struct RotateSpringModifier: ViewModifier {
    
    let angle: Double
        
    func body(content: Content) -> some View {
        content
            .rotationEffect(.degrees(angle))
            .animation(.spring())
    }
}

extension View {
    func rotateModifierWithSpring(_ angle: Double) -> some View {
        self.modifier(RotateSpringModifier(angle: angle))
    }
}
