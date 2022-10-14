//
//  GameState.swift
//  TicTacToe
//
//  Created by ivan on 10/13/22.
//

import Foundation

class GameState: ObservableObject
{
    @Published var board = [Cell]()
    @Published var turn = Tile.Cross
    @Published var circlesScore = 0
    @Published var crossesScore = 0
    @Published var showAlert = false
    @Published var alertMessage = "Tie"



    init()
    {
        resetBoard()
    }

    func placeTile(_ piece: Int)
    {
        if(board[piece].tile != Tile.Empty)
        {
            return
        }

        board[piece].tile = turn == Tile.Cross ? Tile.Cross : Tile.Circle


        if(checkForVictory())
        {
            if(turn == Tile.Cross)
            {
                crossesScore += 1
            }
            else
            {
                circlesScore += 1
            }
            let winner = turn == Tile.Cross ? "Crosses" : "Circles"
            alertMessage = winner + " Win!"
            showAlert = true
        }
        else
        {
            turn = turn == Tile.Cross ? Tile.Circle : Tile.Cross
        }

//        if(checkForTie())
//        {
//            resetBoard()
//
//        }
//
//
//        func checkForTie() -> Bool
//        {
//                for _ in board
//                {
//                    if(board[piece].tile == Tile.Empty){
//                        return false
//                    }
//                }
//
//                return true
//        }
    }
        func checkForVictory() -> Bool
        {
            if(isTurnTile(0) && isTurnTile(1) && isTurnTile(2))
            {
                return true
            }
            if(isTurnTile(3) && isTurnTile(4) && isTurnTile(5))
            {
                return true
            }
            if(isTurnTile(6) && isTurnTile(7) && isTurnTile(8))
            {
                return true
            }
            if(isTurnTile(0) && isTurnTile(3) && isTurnTile(6))
            {
                return true
            }
            if(isTurnTile(1) && isTurnTile(4) && isTurnTile(7))
            {
                return true
            }
            if(isTurnTile(2) && isTurnTile(5) && isTurnTile(8))
            {
                return true
            }
            if(isTurnTile(0) && isTurnTile(4) && isTurnTile(8))
            {
                return true
            }
            if(isTurnTile(2) && isTurnTile(4) && isTurnTile(6))
            {
                return true
            }
            

            return false
        }

        func isTurnTile(_ piece: Int) -> Bool
         {
             return board[piece].tile == turn
         }


        func resetBoard()
        {
            var newBoard = [Cell]()
            
            for _ in 0...8
            {
                newBoard.append(Cell(tile: Tile.Empty))
            }
            board = newBoard
        }
    }

