//
//  ContentView.swift
//  Calculator
//
//  Created by Jasmine Muman on 2022-11-28.
//

import SwiftUI

enum CalcButton: String{
    case one
    case two
    case three
    case four
    case five
    case six
    case seven
    case eight
    case nine
    case zero
    case add
    case subtract
    case divide
    case multiply
    case equals
    case decimal
    case percentage
    case clear
    case postiveNegative
}

struct ContentView: View {
    
    let buttons: [[CalcButton]] = [
        [.seven, .eight, .nine]
    ]
    var body: some View {
        ZStack{
            Color.black.edgesIgnoringSafeArea(.all)
            VStack{
                //Text Display
                HStack{
                    Spacer()
                    Text("0")
                        .foregroundColor(.white)
                        .bold()
                        .font(.system(size: 64))
                }
                .padding()
                //Buttons
                ForEach(buttons, id: \.self){ row in
                    ForEach(row, id: \.self){ item in
                        Button(action:{
                            
                        },label: {
                            Text(item.rawValue)
                                .frame(width: 70, height: 70)
                                .background(Color.orange)
                                .foregroundColor(Color.white)
                                .cornerRadius(35)
                        })
                        
                    }
                }
                
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
