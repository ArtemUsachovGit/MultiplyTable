//
//  SubmitButton.swift
//  MultiTable
//
//  Created by Artem Usachov on 12.05.2021.
//

import SwiftUI

struct SubmitButton: View {
    
    let title: String
    let isHidden: Bool
    let action: () -> Void
    
    var body: some View {
        
        Button(action: action) {
            Text(title)
                .padding(.horizontal, 30)
                .padding(.vertical, 10)
                .foregroundColor(Color.white)
                .background(Color.green)
                .clipShape(Capsule())
        }.opacity(isHidden ? 0 : 1)
    }
}
