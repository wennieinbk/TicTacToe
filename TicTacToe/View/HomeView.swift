//
//  HomeView.swift
//  TicTacToe
//
//  Created by ivan on 10/19/22.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        let fontSize = CGFloat(45)
        NavigationView {
            VStack {
                HStack {
                    Text("Game Time").font(.system(size: fontSize)).bold()
                    Image(systemName: "flag.2.crossed").font(.system(size: fontSize))
                }
                HStack {
                    NavigationLink(destination: TicTacToeView()) {
                        Text("Tic Tac Toe")
                            .padding()
                            .frame(width: 150, height: 200)
                            .background(Rectangle()
                                .foregroundColor(Color.clear)
                                .border(Color.blue, width: 1))
                    }

                    NavigationLink(destination: GuessNumberView()) {
                        Text("Guess Number")
                            .foregroundColor(.red)
                            .padding()
                            .frame(width: 150, height: 200)
                            .background(Rectangle()
                                .foregroundColor(Color.clear)
                                .border(Color.red, width: 1))
                    }
                }
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
