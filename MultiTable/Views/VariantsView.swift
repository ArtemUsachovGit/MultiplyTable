//
//  VariantsView.swift
//  MultiTable
//
//  Created by Artem Usachov on 12.05.2021.
//

import SwiftUI

struct VariantsView: View {
    
    @Binding var numberOfQuestionsIndex: Int
    @State private var selectedIndex = -1
        
    let numberOfQuestions: [String]
    let variantImages: [String]

    var body: some View {
        VStack(spacing: 10) {
            Text("Please choose number of variants")
                .foregroundColor(.white)
                .font(.system(size: 24, weight: .bold))
                .multilineTextAlignment(.center)
            HStack(alignment: .top) {
                ForEach(0..<numberOfQuestions.count) { index in
                    VStack(spacing: 10) {
                        Button(action: {
                            numberOfQuestionsIndex = index
                            selectedIndex = index
                        }, label: {
                            Image(variantImages[index])
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                        })
                        let number = numberOfQuestions[index]
                        if number == "All" {
                            Text(number)
                                .font(.system(size: 16, weight: .bold))
                                .foregroundColor(selectedIndex == index ? .white : .black)
                        } else {
                            Image(systemName: "\(number).circle")
                                .font(.system(size: 24))
                                .foregroundColor(selectedIndex == index ? .white : .black)
                                
                        }
                    }
                }
            }
        }
    }
}
