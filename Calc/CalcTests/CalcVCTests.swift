//
//  CalcVCTests.swift
//  CalcTests
//
//  Created by Vinoth Vino on 02/08/19.
//  Copyright © 2019 Vinoth Vino. All rights reserved.
//

import XCTest
@testable import Calc

class CalcVCTests: XCTestCase {

    var sut: CalculatorViewController!
    
    override func setUp() {
        super.setUp()
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        sut = storyboard.instantiateViewController(identifier: "CalculatorViewController")
        sut.loadViewIfNeeded()
    }

    override func tearDown() {
        sut = nil
        super.tearDown()
    }

    func testAddingValue_ShouldUpdateLabel() {
        sut.twoBtn.sendActions(for: .touchUpInside)
        sut.fourBtn.sendActions(for: .touchUpInside)
        XCTAssertEqual(sut.valueLabel.text, "24")
    }
    
    func testEqualsBtn_ShoulddPerformCalculationAndUpdateLabel() {
        sut.twoBtn.sendActions(for: .touchUpInside)
        sut.fiveBtn.sendActions(for: .touchUpInside)
        sut.subtractBtn.sendActions(for: .touchUpInside)
        sut.fiveBtn.sendActions(for: .touchUpInside)
        sut.equalsBtn.sendActions(for: .touchUpInside)
        XCTAssertEqual(sut.valueLabel.text, "20")
    }
    
    func testOperandBtn_ShouldChangeOperationAndWhenTapped() {
        sut.fourBtn.sendActions(for: .touchUpInside)
        sut.multiplyBtn.sendActions(for: .touchUpInside)
        sut.addBtn.sendActions(for: .touchUpInside)
        sut.threeBtn.sendActions(for: .touchUpInside)
        sut.equalsBtn.sendActions(for: .touchUpInside)
        XCTAssertEqual(sut.valueLabel.text, "7")
    }
    
    func testClearBtn_ShouldClearLabel() {
        sut.eightBtn.sendActions(for: .touchUpInside)
        sut.sevenBtn.sendActions(for: .touchUpInside)
        sut.acBtn.sendActions(for: .touchUpInside)
        XCTAssertEqual(sut.valueLabel.text, "0")
    }

}
