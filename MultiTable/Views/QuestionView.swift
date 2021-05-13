//
//  QuestionView.swift
//  MultiTable
//
//  Created by Artem Usachov on 13.05.2021.
//

import SwiftUI

struct QuestionView: View {
    
    @State private var angle: Double = 0
    
    @Binding var answer: String
    @Binding var submitHidden: Bool
    
    var q: Question
    var questionCompleted: () -> Void
    
    var body: some View {
        Group {
            Text(q.question)
                .font(.system(size: 48, weight: .bold))
                .foregroundColor(.white)
                .rotateModifierWithSpring(angle)
            TextField("Answer", text: $answer)
                .roundedCenteredTextfield(keyboardType: .numberPad)
                .frame(width: 75)
            SubmitButton(title: "Submit", isHidden: submitHidden) {
                angle += 360
                questionCompleted()
            }
        }
    }
}
