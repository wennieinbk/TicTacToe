//
//  GuessNumberView.swift
//  TicTacToe
//
//  Created by ivan on 10/20/22.
//

import SwiftUI

struct GuessNumberView: View {
    @StateObject var numberState = NumberState()
    @State private var guessNumber: Int = 0
    @State private var targetNumber: Int = Int.random(in: 1 ..< 100)

    private static let formatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        return formatter
    }()

    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    Text("Input your lucky number")
                        .bold()
                        .font(.system(size: 20))
                    Image(systemName: "lightbulb").font(.system(size: 20))
                    TextField("Input Number", value: $guessNumber, formatter: Self.formatter)
                        .padding()
                        .frame(width: 70, height: 30)
                        .background(Rectangle()
                            .foregroundColor(Color.clear)
                            .border(Color.blue, width: 1))
                }
                Text(String(numberState.compareNumber(guessNumber, targetNumber)))
                    .bold()
                    .font(.system(size: 25)).italic()

                Button(action: {
                    targetNumber = Int.random(in: 1 ..< 100)
                }) {
                    Text("New Game")
                }
                .padding()
                .background(Color.blue)
                .cornerRadius(8)
                .foregroundColor(Color.white)
            }
        }
    }
}

struct GuessNumberView_Previews: PreviewProvider {
    static var previews: some View {
        GuessNumberView()
    }
}
