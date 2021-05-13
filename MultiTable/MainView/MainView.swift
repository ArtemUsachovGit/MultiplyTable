//
//  ContentView.swift
//  MultiTable
//
//  Created by Artem Usachov on 11.05.2021.
//

import SwiftUI

struct MainView: View {
    
    @ObservedObject var viewModel = MainViewModel()
    
    @State private var gameStarted: Bool = false
    @State private var currentQuestion: Question?
    
    private var rightButtonTitle: String {
        gameStarted ? "Stop" : "Start"
    }
    
    private var navigaitonTitle: String {
        gameStarted ? "Multiplying" : "Let's multiply"
    }
    
    let layout = [GridItem(.adaptive(minimum: 70))]
    
    var body: some View {
        NavigationView {
            ZStack {
                LinearGradient(
                    gradient: Gradient(colors: [Color.orange, Color.yellow]),
                    startPoint: .top,
                    endPoint: .bottom)
                    .edgesIgnoringSafeArea(.all)
                VStack(spacing: 10) {
                    if !gameStarted {
                        VariantsView(numberOfQuestionsIndex: $viewModel.numberOfQuestionsIndex,
                                     numberOfQuestions: viewModel.numberOfQuestions,
                                     variantImages: viewModel.varianImages)
                        SelectMultiplicandView(layout: layout,
                                               selectedNumber: $viewModel.selectedNumber)
                    } else {
                        Spacer()//add spacer to center view on screen
                        if let q = self.currentQuestion {
                            QuestionView(answer: $viewModel.answer,
                                         submitHidden: $viewModel.submitDisabled, q: q) {
                                currentQuestion = viewModel.nextQuestion
                            }
                        } else {
                            HStack {
                                Text("Your result is - ")
                                    .foregroundColor(.white)
                                    .font(.system(size: 24, weight: .semibold))
                                
                                Text("\(viewModel.score)/\(viewModel.allQuestionsCount)")
                                    .foregroundColor(.green)
                                    .font(.system(size: 36, weight: .semibold))
                            }                            
                        }
                    }
                    Spacer() //add spacer to take action button to the botton of the screen
                    GameActionButton(action: {
                        gameStarted.toggle()
                        if gameStarted {
                            viewModel.resetState()
                            currentQuestion = viewModel.nextQuestion
                        }
                    }, gameStarted: gameStarted)
                }.padding(.all)
            }
            .navigationBarTitle(Text(navigaitonTitle), displayMode: .inline)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
