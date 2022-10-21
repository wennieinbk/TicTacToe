//
//  GameState.swift
//  TicTacToe
//
//  Created by ivan on 10/13/22.
//

import Foundation
import SwiftUI

class GameState: ObservableObject {
    @Published var board = [[Cell]]()
    @Published var emptyTiles = 0
    @Published var size = 3
    @Published var turn = Tile.Cross
    @Published var circlesScore = 0
    @Published var crossesScore = 0
    @Published var showAlert = false
    @Published var alertMessage = "Tie"
    // @Binding var size: Int

    init() {
        resetBoard()
    }

    func turnText() -> String {
        return turn == Tile.Cross ? "X's turn" : "O's turn"
    }

    func placeTile(_ row: Int, _ column: Int) {
        if board[row][column].tile != Tile.Empty {
            return
        }

        board[row][column].tile = turn == Tile.Cross ? Tile.Cross : Tile.Circle
        emptyTiles -= 1

        if checkVertically() || checkHorizontally() || checkDiagnally() || checkAntiDiagnally() {
            if turn == Tile.Cross {
                crossesScore += 1
            } else {
                circlesScore += 1
            }
            let winner = turn == Tile.Cross ? "Crosses" : "Circles"
            alertMessage = winner + " Win!"
            showAlert = true
        } else {
            if emptyTiles == 0 {
                alertMessage = "Tie"
                showAlert = true
                resetBoard()
            }
            turn = turn == Tile.Cross ? Tile.Circle : Tile.Cross
        }
    }

    func checkVertically() -> Bool {
        for column in 0 ..< size {
            var count = 0
            for row in 0 ..< size {
                count += valueOfTurnTile(row, column)
                if abs(count) == size {
                    return true
                }
            }
        }
        return false
    }

    func checkHorizontally() -> Bool {
        for row in 0 ..< size {
            var count = 0
            for column in 0 ..< size {
                count += valueOfTurnTile(row, column)
                if abs(count) == size {
                    return true
                }
            }
        }
        return false
    }

    func checkDiagnally() -> Bool {
        var count = 0
        for row in 0 ..< size {
            for column in 0 ..< size {
                if row == column {
                    count += valueOfTurnTile(row, column)
                }
            }
        }
        if abs(count) == size {
            return true
        }

        return false
    }

    func checkAntiDiagnally() -> Bool {
        var count = 0
        for row in 0 ..< size {
            for column in 0 ..< size {
                if row + column == size - 1 {
                    count += valueOfTurnTile(row, column)
                }
            }
        }
        if abs(count) == size {
            return true
        }
        return false
    }

    func valueOfTurnTile(_ row: Int, _ column: Int) -> Int {
        //            if(board[row][column].tile != Tile.Empty){
        //                return board[row][column].tile) == Tile.Cross ? 1 : -1
        //            }
        if (board[row][column].tile) == Tile.Cross {
            return 1
        } else if (board[row][column].tile) == Tile.Circle {
            return -1
        }
        return 0
    }

    func resetBoard() {
        var newBoard = [[Cell]]()

        for _ in 0 ... size {
            var row = [Cell]()
            for _ in 0 ... size {
                row.append(Cell(tile: Tile.Empty))
            }
            newBoard.append(row)
        }
        board = newBoard
        emptyTiles = size * size
    }
}
