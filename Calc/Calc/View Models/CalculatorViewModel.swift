//
//  CalculatorViewModel.swift
//  Calc
//
//  Created by Vinoth Vino on 01/08/19.
//  Copyright © 2019 Vinoth Vino. All rights reserved.
//


import Foundation

struct CalculatorViewModel {
    var valueA: Int = 0
    var valueB: Int = 0
    var currentOperand: Operand?
    var valueEntryArray: [Int] = []
    
    mutating func insert(value: Int) { 
        if valueA == 0 {
            self.valueA = value
        } else {
            self.valueB = value
        }
    }
    
    mutating func set(operand: Operand) {
        self.currentOperand = operand
        setValues()
    }
    
    mutating func append(_ value: Int) {
        valueEntryArray.append(value)
    }
    
    mutating func clearValues() -> String {
        valueEntryArray = []
        valueA = 0
        valueB = 0
        return "\(valueEntryArray.count)"
    }
    
    func stringifyValues() -> String {
        var stringArray: [String] = []
        for int in valueEntryArray {
            stringArray.append(String(int))
        }
        return stringArray.joined()
    }
    
    mutating func setValues() {
        var valueString = ""
        _ = valueEntryArray.map { valueString = valueString + "\($0)" }
        guard let intValue = Int(valueString) else { return }
        insert(value: intValue)
        valueEntryArray = []
    }
    
    mutating func calculate() -> Int {
        setValues()
        guard let currentOperand = currentOperand else { fatalError() }
        switch currentOperand {
        case .add:
            return valueB + valueA
        case .subtract:
            return valueA - valueB
        case .multiply:
            return valueA * valueB
        case .divide:
            return valueA / valueB
        }
    }
}

extension CalculatorViewModel: Equatable {
    static func ==(lhs: CalculatorViewModel, rhs: CalculatorViewModel) -> Bool {
        if lhs.valueA != rhs.valueA {
            return false
        } else if lhs.valueB != rhs.valueB {
            return false
        } else if lhs.currentOperand != rhs.currentOperand {
            return false
        } else if lhs.valueEntryArray != rhs.valueEntryArray {
            return false
        }
        return true
    }
}
