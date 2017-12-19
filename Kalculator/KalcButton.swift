//
//  KalcButton.swift
//  Kalculator
//
//  Created by Gena Beraylik on 04.08.17.
//  Copyright © 2017 Beraylik. All rights reserved.
//

import UIKit

class KalcObject {
    var mainExpression: String = ""
    var outputValue: String = ""
    var inputValue: String  = ""
    
    init() {
        outputValue = "0"
    }
    
    func setInputValue(newValue: String) {
        if inputValue.characters.count < 10 {
            if inputValue == "0" {
                inputValue = newValue
            } else {
                inputValue.append(newValue)
            }
        }
    }
    
    func addToMainExpression( newValue: String) {
        var newValue = newValue
        if !newValue.contains(".") {
            newValue.append(".0")
        }
        if newValue.contains("-") {
            newValue.insert(")", at: newValue.endIndex)
            newValue = newValue.replacingOccurrences(of: "-", with: "-(")
        }
        mainExpression.append(newValue)
        inputValue = ""
        outputValue = ""
    }
    
    func pressedBtn(command: String) -> String {
        
        inputValue = outputValue
        
        switch command {
        case "AC":
            mainExpression = ""
            inputValue = "0"
        case ",":
            if !inputValue.contains(".") {
                inputValue.append(".")
            }
        case "+/-":
            if inputValue.contains("-") {
                inputValue.remove(at: inputValue.startIndex)
            } else {
                inputValue.insert("-", at: inputValue.startIndex)
            }
        case "%":
            let math = NSExpression(format: "\(inputValue)/100.0")
            inputValue = String(math.expressionValue(with: nil, context: nil) as! Float)
        case "*", "/", "+", "-":
            let result = inputValue
            addToMainExpression(newValue: inputValue)
            mainExpression.append(command)
            return result
        case "=":
            
            mainExpression.append(inputValue)
            let math = NSExpression(format: mainExpression)
            inputValue = String(math.expressionValue(with: nil, context: nil) as! Float)
            
            if inputValue.hasSuffix(".0") {
                inputValue = inputValue.replacingOccurrences(of: ".0", with: "")
            }
            
            mainExpression = ""
            
        default:
            setInputValue(newValue: command)
        }
        
        
        outputValue = inputValue
        
        return outputValue
    }
    
}


extension UIButton {
    
    func setButtonStyle(title: String) {
        self.layer.borderWidth = 0.3
        self.setTitle(title, for: .normal)
        self.titleLabel?.font = UIFont.systemFont(ofSize: 24)
        self.addTarget(CalcViewController(), action: #selector(CalcViewController.multiply(sender:)), for: .touchUpInside)
        
        switch title {
        case "/", "*", "-", "+", "=":
            self.backgroundColor = .orange
        case "AC", "+/-", "%":
            self.backgroundColor = .gray
        default:
            self.backgroundColor = .lightGray
        }
        
    }
    
}
