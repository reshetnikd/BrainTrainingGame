//
//  ContentView.swift
//  BrainTrainingGame
//
//  Created by Dmitry Reshetnik on 22.01.2020.
//  Copyright © 2020 Dmitry Reshetnik. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State private var appCurrentChoice = Int.random(in: 0..<2)
    @State private var shouldWin = Bool.random()
    @State private var score = 0
    @State private var moves = 0
    @State private var isGameOver = false
    
    let possibleMoves = ["✊🏻", "✋🏻", "✌🏻"]
    
    var body: some View {
        VStack {
            Text("Score: \(score)")
                .font(.headline)
                .fontWeight(.bold)
            
            Text("\(possibleMoves[appCurrentChoice])")
                .font(.system(size: 64))
            
            Text("You should \(shouldWin ? "Win" : "Lose")")
            
            HStack {
                ForEach(0..<3) { number in
                    Button(action: {
                        self.playerResponse(number)
                    }) {
                        Text(self.possibleMoves[number])
                            .font(.system(size: 64))
                    }
                }
            }
        }.alert(isPresented: $isGameOver) {
            Alert(title: Text("Game Over"), message: Text("You are run out of moves"), dismissButton: .cancel())
        }
    }
    
    func nextMove() {
        appCurrentChoice = Int.random(in: 0..<2)
        shouldWin = Bool.random()
        moves += 1
        isGameOver = moves > 10
    }
    
    func playerResponse(_ number: Int) {
        if shouldWin {
            switch appCurrentChoice {
            case 0:
                if number == 1 {
                    score += 1
                } else {
                    score -= 1
                }
            case 1:
                if number == 2 {
                    score += 1
                } else {
                    score -= 1
                }
            case 2:
                if number == 0 {
                    score += 1
                } else {
                    score -= 1
                }
            default:
                break
            }
        } else {
            switch appCurrentChoice {
            case 0:
                if number == 2 {
                    score += 1
                } else {
                    score -= 1
                }
            case 1:
                if number == 0 {
                    score += 1
                } else {
                    score -= 1
                }
            case 2:
                if number == 1 {
                    score += 1
                } else {
                    score -= 1
                }
            default:
                break
            }
        }
        nextMove()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
