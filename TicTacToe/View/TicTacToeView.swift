//
//  ContentView.swift
//  TicTacToe
//
//  Created by ivan on 10/12/22.
//

import SwiftUI

struct TicTacToeView: View {
    @StateObject var gameState = GameState()
//    init(size: Int) {
//        gameState.size = size
//    }
    var body: some View {
        Text("Score")
            .underline().font(.title)
            .bold()
        Text(String(format: "Circles: %d", gameState.circlesScore))
            .font(.title)
            .bold()
        Text(String(format: "Crosses: %d", gameState.crossesScore))
            .font(.title)
            .bold()
        Text(gameState.turnText())
            .font(.title)
            .bold()
            .padding()

        VStack {
            ForEach(0 ..< gameState.size) {
                row in
                HStack {
                    ForEach(0 ..< gameState.size) {
                        column in
                        let cell = gameState.board[row][column]
                        Text(cell.displayTile())
                            .font(.largeTitle)
                            .foregroundColor(cell.displayColor())
                            .bold()
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .aspectRatio(1, contentMode: .fit)
                            .background(Color.white)
                            .onTapGesture {
                                gameState.placeTile(row, column)
                            }
                    }
                }
            }
        }
        .background(Color.black)
        .padding()
        .alert(isPresented: $gameState.showAlert) {
            Alert(
                title: Text(gameState.alertMessage),
                dismissButton: .default(Text("Another Game")) {
                    gameState.resetBoard()
                }
            )
        }

        Spacer()
    }
}

// struct TicTacToeView_Previews: PreviewProvider {
//    static var previews: some View {
//        TicTacToeView()
//    }
// }
