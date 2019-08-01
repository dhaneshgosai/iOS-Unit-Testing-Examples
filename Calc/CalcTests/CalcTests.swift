//
//  CalcTests.swift
//  CalcTests
//
//  Created by Vinoth Vino on 01/08/19.
//  Copyright © 2019 Vinoth Vino. All rights reserved.
//

import XCTest
@testable import Calc

class CalcTests: XCTestCase {

    var sut: CalculationManager!
    
    override func setUp() {
        super.setUp()
        sut = CalculationManager()
    }

    override func tearDown() {
        sut = nil
        super.tearDown()
    }

    func testInit_WhenGivenValues_TakesValues() {
        let calcManager1 = CalculationManager(valueA: 10, valueB: 20, currentOperand: .multiply, valueEntryArray: [])
        let calcManager2 = CalculationManager(valueA: 10, valueB: 20, currentOperand: .multiply, valueEntryArray: [])
        XCTAssertEqual(calcManager1, calcManager2)
    }
    
    func testValues_AreInitiallyZero() {
        XCTAssertEqual(sut.valueA, 0)
        XCTAssertEqual(sut.valueB, 0)
    }
    
    func testValues_InsertingValues_ChangesValueA() {
        sut.insert(value: 10)
        XCTAssertEqual(sut.valueA, 10)
    }
    
    func testOperand_IsInitiallyNil() {
        XCTAssertNil(sut.currentOperand, "Operand should be nil")
    }
    
    func testOperand_WhenGivenOperand_SetsOperand() {
        sut.insert(value: 42)
        sut.set(operand: .subtract)
        XCTAssertNotNil(sut.currentOperand)
    }
    
    func testCalculation_ForValues() {
        sut.insert(value: 15)
        sut.set(operand: .subtract)
        sut.insert(value: 5)
        XCTAssertEqual(sut.calculate(), 10)
    }
    
    func testClear_WhenCalledClearValues() {
        sut.insert(value: 20)
        _ = sut.clearValues()
        XCTAssertEqual(sut.valueA, 0)
        XCTAssertEqual(sut.valueB, 0)
        XCTAssertEqual(sut.valueEntryArray, [])
    }
}
