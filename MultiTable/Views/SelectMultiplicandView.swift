//
//  SelectMultiplicandView.swift
//  MultiTable
//
//  Created by Artem Usachov on 12.05.2021.
//

import SwiftUI

struct SelectMultiplicandView: View {
    
    let layout: [GridItem]
    
    @Binding var selectedNumber: Int
    @State var selectedIndex = 0
    
    var body: some View {
        VStack(spacing: 10) {
            Text("Please choose multiplicand")
                .foregroundColor(.white)
                .font(.system(size: 24, weight: .bold))
            ScrollView {
                LazyVGrid(columns: layout, spacing: 10) {
                    ForEach(MainViewModel.numbers, id: \.self) { index in
                        Button(action: {
                            selectedNumber = index
                            selectedIndex = index
                        }, label: {
                            Image(systemName: "\(index).circle")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .foregroundColor(index == selectedIndex ? .white : .black)
                        })
                    }
                }
            }
        }
    }
}
