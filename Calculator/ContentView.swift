//
//  ContentView.swift
//  Calculator
//
//  Created by Jasmine Muman on 2022-11-28.
//

import SwiftUI

enum CalcButton: String{
    case one = "1"
    case two = "2"
    case three = "3"
    case four = "4"
    case five = "5"
    case six = "6"
    case seven = "7"
    case eight = "8"
    case nine = "9"
    case zero = "0"
    case add = "+"
    case subtract = "-"
    case divide = "/"
    case multiply = "*"
    case equals = "="
    case decimal = "."
    case percentage = "%"
    case clear = "AC"
    case postiveNegative = "-/+"
    
    var buttonColor: Color{
        switch self{
        case .add, .subtract, .divide, .multiply, .equals:
            return .orange
        case .clear, .postiveNegative, .percentage:
            return Color(.lightGray)
        default:
            return Color(UIColor(red: 55/255.0, green: 55/255.0, blue: 55/255.0, alpha: 1))
        }
    }
}

enum Operation{
    case add, subtract, multiply, divide, none
}

struct ContentView: View {
    
    @State var value = "0"
    @State var runnigNumber = 0
    @State var currentOperation: Operation = .none
    
    let buttons: [[CalcButton]] = [
        [.clear, .postiveNegative, .percentage, .divide],
        [.seven, .eight, .nine, .multiply],
        [.four, .five, .six, .subtract],
        [.one, .two, .three, .add],
        [.zero, .decimal, .equals],
    ]
    var body: some View {
        ZStack{
            Color.black.edgesIgnoringSafeArea(.all)
            VStack{
                //Text Display
                Spacer()
                HStack{
                    Spacer()
                    Text(value)
                        .foregroundColor(.white)
                        .bold()
                        .font(.system(size: 72))
                }
                .padding()
                //Buttons
                ForEach(buttons, id: \.self){ row in
                    HStack(spacing:12){
                        ForEach(row, id: \.self){ item in
                            Button(action:{
                                self.didTap(button: item)
                            },label: {
                                Text(item.rawValue)
                                    .font(.system(size:32))
                                    .frame(width: self.buttonWidth(item: item),
                                           height: self.buttonHeight()
                                    )
                                    .background(item.buttonColor)
                                    .foregroundColor(Color.white)
                                    .cornerRadius(self.buttonWidth(item: item)/2)
                            })
                            
                        }
                    }
                    .padding(.bottom,3)
                }
                
            }
        }
    }
    
    func didTap(button:CalcButton){
        switch button{
        case .add, .subtract, .multiply, .divide, .equals:
            if button == .add{
                self.currentOperation = .add
                self.runnigNumber = Int(self.value) ?? 0
            }
            if button == .subtract{
                self.currentOperation = .subtract
                self.runnigNumber = Int(self.value) ?? 0
            }
            if button == .multiply{
                self.currentOperation = .multiply
                self.runnigNumber = Int(self.value) ?? 0
            }
            if button == .divide{
                self.currentOperation = .divide
                self.runnigNumber = Int(self.value) ?? 0
            }
            if button == .equals{
                let runningValue = self.runnigNumber
                let currentValue = Int(self.value) ?? 0
                switch self.currentOperation{
                case .add: self.value = "\(runningValue + currentValue)"
                case .subtract: self.value = "\(runningValue - currentValue)"
                case .multiply: self.value = "\(runningValue * currentValue)"
                case .divide: self.value = "\(runningValue / currentValue)"
                case .none:
                    break
                }
            }
            if button != .equals{
                self.value = "0"
            }
        case .decimal, .postiveNegative, .percentage:
            break
        case .clear:
            self.value = "0"
        default:
            let number = button.rawValue
            if self.value == "0"{
                value = number
            }
            else{
                self.value = "\(self.value)\(number)"
            }
        }
    }
    
    func buttonWidth(item:CalcButton)-> CGFloat{
        if item == .zero{
            return((UIScreen.main.bounds.width - (4*12))/4) * 2
        }
        return(UIScreen.main.bounds.width - (5*12))/4
    }
    func buttonHeight()-> CGFloat{
        return(UIScreen.main.bounds.width - (5*12))/4
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
