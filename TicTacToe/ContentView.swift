//
//  ContentView.swift
//  TicTacToe
//
//  Created by ivan on 10/12/22.
//

import SwiftUI

struct Cell
{
    var tile: Tile
    func displayTile() -> String
    {
        switch(tile)
        {
            case Tile.Cross:
                return "X"
            case Tile.Circle:
                return "O"
            default:
                return ""
        }
    }
}

enum Tile
{
    case Circle
    case Cross
    case Empty
}


struct ContentView: View {
    @StateObject var gameState = GameState()
    let columns = [GridItem(.flexible()),
                   GridItem(.flexible()),
                   GridItem(.flexible())]

    var body: some View {

        Text(String(format: "Tic Tac Toe"))
         .font(.system(size: 60))
         .bold()
        Text(String(format: "Score"))
         .underline() .font(.title)
         .bold()
        Text(String(format: "Circles: %d", gameState.circlesScore))
         .font(.title)
         .bold()
        Text(String(format: "Crosses: %d", gameState.crossesScore))
         .font(.title)
         .bold()


           VStack{
               LazyVGrid(columns: columns){
                ForEach(0..<9) {
                    i in
                    let cell = gameState.board[i]
                    Text(cell.displayTile())
                        .font(.largeTitle)
                        .bold()
                        .frame(maxWidth: .infinity, maxHeight: .infinity)                             .aspectRatio(1, contentMode: .fit)
                        .background(Color.white)
                        .onTapGesture{
                            gameState.placeTile(i)
                        }
                
                }

            }
        }
           .background(Color.black)
           .padding()
           .alert(isPresented: $gameState.showAlert)
            {
                Alert(
                    title: Text(gameState.alertMessage),
                    dismissButton: .default(Text("Another Game"))
                    {
                    gameState.resetBoard()
                    }
                )
            }

           Spacer()
       }

}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
