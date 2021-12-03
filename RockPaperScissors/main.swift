//
//  main.swift
//  RockPaperScissors
//
//  Created by Aisaule Sibatova on 01.12.2021.
//

import Foundation

enum Gesture: String, CaseIterable {
    case rock
    case paper
    case scissors
}

extension Gesture: Comparable {
    static func < (lhs: Gesture, rhs: Gesture) -> Bool {
        switch (lhs, rhs) {
        case (.rock, .paper):
            return true
        case (.paper, .scissors):
            return true
        case (.rock, .scissors):
            return false
        default:
            return false
        }
    }

    static func == (lhs: Gesture, rhs: Gesture) -> Bool {
        switch (lhs, rhs) {
        case (.rock, .rock):
            return true
        case (.paper, .paper):
            return true
        case (.scissors, .scissors):
            return true
        default:
            return false
        }
    }
}

class Player {
    let gesture: Gesture

    init(gesture: Gesture) {
        self.gesture = gesture
    }

    func play(versus: Player) -> String {
        if self.gesture == versus.gesture {
            return "Draw"
        } else {
            return self.gesture > versus.gesture ? "WIN" : "LOSS"
        }
    }
}

print("Player 1: ", terminator: "")
let player1 = Player(gesture: Gesture(rawValue: readLine()!.lowercased())!)
let player2 = Player(gesture: Gesture.allCases.randomElement()!)
print("Player 2: \(player2.gesture.rawValue.capitalized)")
print("Player 1 playing vs Player 2...")
print(player1.play(versus: player2))

