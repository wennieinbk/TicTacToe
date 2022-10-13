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

       var body: some View
       {
           let borderSize = CGFloat(5)


           Spacer()
           Text(String(format: "Circles: %d", gameState.circlesScore))
               .font(.title)
               .bold()
               .padding()

           Text(String(format: "Crosses: %d", gameState.crossesScore))
               .font(.title)
               .bold()
               .padding()

           VStack(spacing: borderSize)
           {
               ForEach(0...2, id: \.self)
               {
                   row in
                   HStack(spacing: borderSize)
                   {
                       ForEach(0...2, id: \.self)
                       {
                           column in

                           let cell = gameState.board[row][column]

                           Text(cell.displayTile())
                               .font(.system(size: 60))
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
           .alert(isPresented: $gameState.showAlert)
           {
               Alert(
                   title: Text(gameState.alertMessage),
                   dismissButton: .default(Text("Ok"))
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
