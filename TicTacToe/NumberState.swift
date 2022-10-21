//
//  GuessNumberState.swift
//  TicTacToe
//
//  Created by ivan on 10/21/22.
//

import Foundation
import SwiftUI
class NumberState: ObservableObject {

    func compareNumber(_ guessNumber: Int, _ targetNumber: Int) -> String {
        let differences = guessNumber - targetNumber
        var s = ""
        switch differences {
        case _ where differences > 0:
            s = "Go lower"
        case _ where differences < 0:
            s = "Go higher"
        case _ where differences == 0:
            s = "Bingo:)"
        default:
            fatalError()
        }
        return s
    }
}
