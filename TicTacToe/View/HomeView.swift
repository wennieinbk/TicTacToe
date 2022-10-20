//
//  HomeView.swift
//  TicTacToe
//
//  Created by ivan on 10/19/22.
//

import SwiftUI

struct HomeView: View {
    @State private var size = 0
    var body: some View {

        NavigationView{
            VStack{
                Text("Archade")
                    .font(.title)
                    .bold()
                NavigationLink(destination: TicTacToeView(size: $size), label: {
                    Button(action: {

                    }, label: {
                        Text("Go")
                    })
                })

                TextField("Enter the side length of board", value: $size, format: .number)
                    .textFieldStyle(.roundedBorder)
                    .padding()

                Text("Start with \(size) * \(size).")
                NavigationLink(destination: TicTacToeView(size: $size), label: {Text("play")})
            }

        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
