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
}
