//
//  GameActionButton.swift
//  MultiTable
//
//  Created by Artem Usachov on 13.05.2021.
//

import SwiftUI

struct GameActionButton: View {
    
    let action: () -> Void
    let gameStarted: Bool
    
    var body: some View {
        Button(action: action, label: {
            Image(systemName: gameStarted ? "memories" : "arrowtriangle.right.circle.fill")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .foregroundColor(.green)
                .frame(width: 60, height: 60)
        })
    }
}
