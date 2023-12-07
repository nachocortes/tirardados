//
//  ContentView.swift
//  app_ios_tirardados3
//
//  Created by Nacho on 06/12/2023.
//

import SwiftUI

struct ContentView: View {
    
    @Environment(\.verticalSizeClass) var sizeClass
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    @State private var dado1 = "dice1"

    var body: some View {
    
        ZStack() {
            
            Image("background")
                            .resizable()
                            .edgesIgnoringSafeArea(.all)
           
            if sizeClass == .regular {
                
                VStack {
            
                    Image("diceeLogo")
                            .shadow(color: Color.white.opacity(0.5), radius: 5, x: 0, y: 5)
     
                    Spacer()

                    GenerarDados(dado: $dado1)
                }
                
            } else if sizeClass == .compact {
                
                    HStack {
                        
                        VStack {
                            
                            Image("diceeLogo")
                                    .shadow(color: Color.white.opacity(0.5), radius: 5, x: 0, y: 5)
                        
                        GenerarDados(dado: $dado1)
                    }
                }
            }
        }
    }
}
    
struct GenerarDados: View {

    @Binding var dado: String
    @State private var dados: [String] = ["dice1", "dice1"]

    var body: some View {
        
        HStack {
           
            ForEach (0..<2) { i in
            
            Image(dados[i])
                        .resizable()
                        .scaledToFit()
                        .frame(width: 150, height: 150)
                        .shadow(color: Color.black.opacity(0.5), radius: 5, x: 0, y: 5)
                        .padding()
            }
        }

        Spacer()
        

        Button(action: {
            dados = NumerosAleatorios()
        }) {
            Text("Roll")
        }
                    .foregroundColor(.white)
                    .font(.system(size: 64, weight: .bold, design: .default))
                    .background(Color.red)
                    .shadow(color: Color.yellow.opacity(0.5), radius: 10, x: 0, y: 10)
                    .padding(.vertical, 5)
    }
}

func NumerosAleatorios() -> [String] {
        return (["dice\(Int.random(in: 1...6))", "dice\(Int.random(in: 1...6))"])
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
