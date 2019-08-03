//
//  CalculatorViewController.swift
//  Calc
//
//  Created by Vinoth Vino on 01/08/19.
//  Copyright © 2019 Vinoth Vino. All rights reserved.
//


import UIKit

class CalculatorViewController: UIViewController {
    
    @IBOutlet var backgroundImageView: UIImageView!
    @IBOutlet var valueLabel: UILabel!
    @IBOutlet var zeroBtn: UIButton!
    @IBOutlet var oneBtn: UIButton!
    @IBOutlet var twoBtn: UIButton!
    @IBOutlet var threeBtn: UIButton!
    @IBOutlet var fourBtn: UIButton!
    @IBOutlet var fiveBtn: UIButton!
    @IBOutlet var sixBtn: UIButton!
    @IBOutlet var sevenBtn: UIButton!
    @IBOutlet var eightBtn: UIButton!
    @IBOutlet var nineBtn: UIButton!
    @IBOutlet var decimalBtn: UIButton!
    @IBOutlet var equalsBtn: UIButton!
    @IBOutlet var addBtn: UIButton!
    @IBOutlet var subtractBtn: UIButton!
    @IBOutlet var multiplyBtn: UIButton!
    @IBOutlet var divideBtn: UIButton!
    @IBOutlet var acBtn: UIButton!
    
    var calculatorViewModel: CalculatorViewModel!

    override func viewDidLoad() {
        super.viewDidLoad()
        calculatorViewModel = CalculatorViewModel()
    }
    
    @IBAction func numberBtnWasPressed(_ sender: UIButton) {
        calculatorViewModel.append(sender.tag)
        self.valueLabel.text = calculatorViewModel.stringifyValues()
    }
    
    @IBAction func acButtonWasPressed(_ sender: UIButton) {
        self.valueLabel.text = calculatorViewModel.clearValues()
    }
    
    @IBAction func operandBtnWasPressed(_ sender: UIButton) {
        guard let operand = Operand(rawValue: sender.tag) else { return }
        calculatorViewModel.set(operand: operand)
    }
    
    @IBAction func equalsBtnWasPressed(_ sender: UIButton) {
        let calculationString = String(describing: calculatorViewModel.calculate())
        self.valueLabel.text = calculationString
    }
}
