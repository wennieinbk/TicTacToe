//
//  HomeView.swift
//  TicTacToe
//
//  Created by ivan on 10/19/22.
//

import SwiftUI

struct HomeView: View {
    //@State private var size = 0
    var body: some View {
        
        NavigationView{
            VStack{
                Text("A").font(.system(size: 45)).bold().foregroundColor(.red)
                + Text("R").font(.system(size: 45)).bold().foregroundColor(.blue)+Text("C")
                    .font(.system(size: 45)).bold().foregroundColor(.red)+Text("A")
                    .font(.system(size: 45)).bold().foregroundColor(.blue)+Text("D")
                    .font(.system(size: 45)).bold().foregroundColor(.red)+Text("E")
                    .font(.system(size: 45)).bold().foregroundColor(.blue)

                    
                    //                        Button("Tic Tac Toe") {
                    //                            print("Tic Tac Toe")
                    //                        }
                    //                        .padding()
                    //                        .clipShape(Capsule())
                    //                        .frame(width: 150, height: 200)
                    //                        .background(Color.clear)
                    //                        .border(Color.blue, width: 1)
                    ////                        TextField("Enter the side length of board", value: $size, format: .number)
                    ////                            .textFieldStyle(.roundedBorder).frame(width: 60, height: nil)
                    ////
                    ////                        Text("With \(size) * \(size).")
                    //                        NavigationLink(destination: TicTacToeView(), label: {Text("play")})
//                    //                    }
//                    Button("Guss Number") {
//                        print("Button pressed!")
//                    }
//                    .padding()
//                    .clipShape(RoundedRectangle())
//                    .frame(width: 150, height: 200)
//                    .background(Color.clear)
//                    .border(Color.red, width: 1)
//                    Button("Guss Number") {
//                        print("Button pressed!")}
//                    .padding()
//                    .clipShape(RoundedRectangle())
//                    .frame(width: 150, height: 200)
//                    .background(Color.clear)
//                    .border(Color.red, width: 1)
                    
                    

                
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
