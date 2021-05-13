//
//  Questions.swift
//  MultiTable
//
//  Created by Artem Usachov on 11.05.2021.
//

import Foundation

struct Question: Identifiable {
    var id = UUID()
    
    let multiplicand: Int
    let multiplier: Int
    
    var question: String {
        "\(multiplicand) x \(multiplier)"
    }
    var answer: String {
        "\(multiplicand * multiplier)"
    }
}
