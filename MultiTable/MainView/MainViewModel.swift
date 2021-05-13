//
//  MainViewModel.swift
//  MultiTable
//
//  Created by Artem Usachov on 11.05.2021.
//

import SwiftUI
import Combine

class MainViewModel: ObservableObject {
    
    static var numbers = 1...12
    
    private var numbersArray: [Int] = Array(numbers)
    private var _nexQuestion: Question?
    private var selectedQuestions: [Question]?
    private var cancelables = Set<AnyCancellable>()
    
    private var animalsPack = ["buffalo", "chick",
                               "chicken", "cow", "crocodile",
                               "dog", "duck", "elephant",
                               "frog", "giraffe", "goat",
                               "gorilla", "hippo", "horse",
                               "monkey", "moose", "narwhal",
                               "owl", "panda", "parrot",
                               "penguin", "pig", "rabbit",
                               "rhino", "sloth", "snake",
                               "walrus", "whale", "zebra"]
        
    private lazy var allQuestions: [Question] = {
        numbersArray.map(makeQuestions).flatMap { $0 }
    }()

    private (set) var score: Int = 0
    
    @Published var numberOfQuestionsIndex = 0
    @Published var selectedNumber = 1
    @Published var answer: String = ""
    @Published var submitDisabled = false
    
    init() {
        $answer
            .map { $0.isEmpty }
            .assign(to: &$submitDisabled)
    }
    
    lazy var varianImages: [String] = {
        makeVariantImages()
    }()
    
    var nextQuestion: Question? {
        score += _nexQuestion?.answer == answer ? 1 : 0
        answer = ""
        _nexQuestion = selectedQuestions?.popLast()
        return _nexQuestion
    }
    
    var allQuestionsCount: String {
        numberOfQuestions[numberOfQuestionsIndex]
    }
    
    var numberOfQuestions = ["5", "10", "20", "All"]
    
    private func updateQuestions() {
        let q = allQuestions.filter { $0.multiplicand == selectedNumber || $0.multiplier == selectedNumber }
        guard let qNumber = Int(numberOfQuestions[numberOfQuestionsIndex]) else {
            selectedQuestions = q
            return
        }
        selectedQuestions = Array(q.shuffled()[0..<qNumber])
    }
    
    func resetState() {
        selectedQuestions = nil
        _nexQuestion = nil
        score = 0
        varianImages = makeVariantImages()
        updateQuestions()
    }
    
    private func makeQuestions(multiplicand: Int) -> [Question] {
        numbersArray.map { multiplier in
            Question(multiplicand: multiplicand, multiplier: multiplier)
        }
    }
    
    private func makeVariantImages() -> [String] {
        animalsPack.shuffle()
        return Array(animalsPack[0...numberOfQuestions.count])
    }
}
