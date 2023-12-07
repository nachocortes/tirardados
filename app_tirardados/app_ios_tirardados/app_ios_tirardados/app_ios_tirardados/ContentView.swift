//
//  ContentView.swift
//  ios_app_tirardados
//
//  Created by Nacho on 28/11/2023.
//

import SwiftUI

struct ContentView: View {

    @Environment(\.verticalSizeClass) var sizeClass
    
    @State private var mostrarDadoAleatorio = false
    @State private var botonRollAvtivado = false
    @State private var dado1: String = "dice1"

    var body: some View {

        if sizeClass == .regular {

            ZStack() {

                Image("background")
                    .resizable()
                    .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)

                VStack() {

                    Image("diceeLogo")
                        .shadow(color: Color.white.opacity(0.5), radius: 5, x: 0, y: 5)
                    
                    Spacer()

                    VStack() {

                        Spacer()

                        HStack() {

                            if mostrarDadoAleatorio {

                                generarDadoAleatorio(dado: $dado1)

                            } else if botonRollAvtivado {

                                generarDadoAleatorio(dado: $dado1)

                            } else {

                                Image(dado1)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 150, height: 150)
                                    .shadow(color: Color.black.opacity(0.5), radius: 5, x: 0, y: 5)
                                    .padding()
                            }

                            if mostrarDadoAleatorio {

                                generarDadoAleatorio(dado: $dado1)

                            } else if botonRollAvtivado {

                                generarDadoAleatorio(dado: $dado1)

                            } else {

                                Image(dado1)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 150, height: 150)
                                    .shadow(color: Color.black.opacity(0.5), radius: 5, x: 0, y: 5)
                                    .padding()
                            }
                        }

                        Spacer()

                        Button("Roll") {

                            mostrarDadoAleatorio.toggle()
                            botonRollAvtivado = true
                        }
                        .foregroundColor(.white)
                        .font(.system(size: 64, weight: .bold, design: .default))
                        .background(Color.red)
                        .shadow(color: Color.yellow.opacity(0.5), radius: 10, x: 0, y: 10)
                        .padding(.vertical, 5)
                    }
                }
            }

        } else {

            ZStack() {

                Image("background")
                    .resizable()
                    .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)

                HStack() {

                    Image("diceeLogo")
                        .shadow(color: Color.white.opacity(0.5), radius: 5, x: 0, y: 5)

                    Spacer()

                    HStack {

                        if mostrarDadoAleatorio {

                            generarDadoAleatorio(dado: $dado1)

                        } else if botonRollAvtivado {

                            generarDadoAleatorio(dado: $dado1)

                        } else {

                            Image(dado1)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 150, height: 150)
                                .shadow(color: Color.black.opacity(0.5), radius: 5, x: 0, y: 5)
                                .padding()
                        }

                        if mostrarDadoAleatorio {

                            generarDadoAleatorio(dado: $dado1)

                        } else if botonRollAvtivado {

                            generarDadoAleatorio(dado: $dado1)

                        } else {

                            Image(dado1)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 150, height: 150)
                                .shadow(color: Color.black.opacity(0.5), radius: 5, x: 0, y: 5)
                                .padding()
                        }
                    }

                    Spacer()

                    Button("Roll") {

                        mostrarDadoAleatorio.toggle()
                        botonRollAvtivado = true
                    }
                    .foregroundColor(.white)
                    .font(.system(size: 64, weight: .bold, design: .default))
                    .background(Color.red)
                    .shadow(color: Color.yellow.opacity(0.5), radius: 10, x: 0, y: 10)
                    .padding(.vertical, 5)
                }
            }
        }
    }
}

struct generarDadoAleatorio: View {

    @Binding var dado: String

    var body: some View {

        Image(dadoAleatorio())
            .resizable()
            .scaledToFit()
            .frame(width: 150, height: 150)
            .shadow(color: Color.black.opacity(0.5), radius: 5, x: 0, y: 5)
            .padding()
    }
}

func dadoAleatorio() -> (String) {
     let num = (Int.random(in: 1...6))
    return ("dice\(num)")
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
