//
//  CellModel.swift
//  TicTacToe
//
//  Created by ivan on 10/19/22.
//

import Foundation
import SwiftUI

struct Cell {
    var tile: Tile
    func displayTile() -> String {
        switch tile {
        case Tile.Cross:
            return "X"
        case Tile.Circle:
            return "O"
        default:
            return ""
        }
    }

    func displayColor() -> Color {
        switch tile {
        case Tile.Cross:
            return Color.blue
        case Tile.Circle:
            return Color.pink
        default:
            return Color.black
        }
    }
}

enum Tile {
    case Circle
    case Cross
    case Empty
}
