//
//  HomeViewController.swift
//  iOS-Calculator
//
//  Created by Jesús Jiménez Sánchez on 6/7/21.
//

import UIKit

final class HomeViewController: UIViewController {

    // MARK: - Outlets
    // Result
    @IBOutlet weak var resultLabel: UILabel!

    // Numbers
    @IBOutlet weak var number0: UIButton!
    @IBOutlet weak var number1: UIButton!
    @IBOutlet weak var number2: UIButton!
    @IBOutlet weak var number3: UIButton!
    @IBOutlet weak var number4: UIButton!
    @IBOutlet weak var number5: UIButton!
    @IBOutlet weak var number6: UIButton!
    @IBOutlet weak var number7: UIButton!
    @IBOutlet weak var number8: UIButton!
    @IBOutlet weak var number9: UIButton!
    @IBOutlet weak var numberDecimal: UIButton!

    // Operator
    @IBOutlet weak var operatorAC: UIButton!
    @IBOutlet weak var operatorPlusMinus: UIButton!
    @IBOutlet weak var operatorPercent: UIButton!
    @IBOutlet weak var operatorDivision: UIButton!
    @IBOutlet weak var operatorMultiplication: UIButton!
    @IBOutlet weak var operatorSubstraction: UIButton!
    @IBOutlet weak var operatorAddition: UIButton!
    @IBOutlet weak var operatorResult: UIButton!

    // MARK: - Constants

    private enum OperationType {
        case none, addition, substraction, multiplication, division, percent
    }

    private let kDecimalSeparator = Locale.current.decimalSeparator
    private let kMaxLength = 9
    private let kMaxValue: Double = 999999999
    private let kMinValue: Double = 0.00000001

    // Aux values formatter
    private let auxFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        let locale = Locale.current

        formatter.groupingSeparator = ""
        formatter.decimalSeparator = locale.decimalSeparator
        formatter.numberStyle = .decimal

        return formatter
    }()

    // Default on screen values formatter
    private let printFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        let locale = Locale.current

        formatter.groupingSeparator = locale.groupingSeparator
        formatter.decimalSeparator = locale.decimalSeparator
        formatter.numberStyle = .decimal
        formatter.maximumIntegerDigits = 9
        formatter.minimumFractionDigits = 0
        formatter.maximumFractionDigits = 8

        return formatter
    }()

    // On screen scientific format values formatter
    private let printScientificFormatter: NumberFormatter = {
        let formatter = NumberFormatter()

        formatter.numberStyle = .scientific
        formatter.maximumFractionDigits = 3
        formatter.exponentSymbol = "e"

        return formatter
    }()

    // MARK: - Variables

    private var total: Double = 0   // Total
    private var temp: Double = 0    // Value on screen
    private var operating = false   // Tell if an operator has been selected
    private var decimal = false     // TGell if the value is decimal
    private var operation: OperationType = .none    // Current operation

    //MARK: - Initialization

    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.

        // UI
        number0.round()
        number1.round()
        number2.round()
        number3.round()
        number4.round()
        number5.round()
        number6.round()
        number7.round()
        number8.round()
        number9.round()
        numberDecimal.round()

        operatorAC.round()
        operatorPlusMinus.round()
        operatorPercent.round()
        operatorDivision.round()
        operatorMultiplication.round()
        operatorSubstraction.round()
        operatorAddition.round()
        operatorResult.round()

        numberDecimal.setTitle(kDecimalSeparator, for: .normal)

        result()
    }

    // MARK: - Buttons Actions

    @IBAction func operatorACAction(_ sender: UIButton) {
        clear()

        sender.shine()
    }

    @IBAction func operatorPlusMinusAction(_ sender: UIButton) {
        temp *= -1

        resultLabel.text = printFormatter.string(from: NSNumber(value: temp))

        sender.shine()
    }

    @IBAction func operatorModuleAction(_ sender: UIButton) {
        if operation != .percent {
            result()
        }

        operating = true
        operation = .percent
        result()

        sender.shine()
    }

    @IBAction func operatorDivisionAction(_ sender: UIButton) {
        result()
        operating = true
        operation = .division

        sender.shine()
    }

    @IBAction func operatorMultiplicationAction(_ sender: UIButton) {
        result()
        operating = true
        operation = .multiplication

        sender.shine()
    }

    @IBAction func operatorSubstractionAction(_ sender: UIButton) {
        result()
        operating = true
        operation = .substraction

        sender.shine()
    }

    @IBAction func operatorAdditionAction(_ sender: UIButton) {
        result()
        operating = true
        operation = .addition

        sender.shine()
    }

    @IBAction func operatorResultAction(_ sender: UIButton) {
        result()

        sender.shine()
    }

    @IBAction func numberDecimalAction(_ sender: UIButton) {
        let currentTemp = auxFormatter.string(from: NSNumber(value: temp))!

        if !operating && currentTemp.count >= kMaxLength {
            return
        }

        resultLabel.text = resultLabel.text! + kDecimalSeparator!
        decimal = true

        sender.shine()
    }

    @IBAction func numberAction(_ sender: UIButton) {
        var currentTemp = auxFormatter.string(from: NSNumber(value: temp))!

        operatorAC.setTitle("C", for: .normal)

        if !operating && currentTemp.count >= kMaxLength {
            return
        }

        // Operation selected
        if operating {
            total = total == 0 ? temp : total
            resultLabel.text = ""
            currentTemp = ""
            operating = false
        }

        // Decimal operation selected
        if decimal {
            currentTemp = "\(currentTemp)\(kDecimalSeparator!)"
            decimal = false
        }

        let number = sender.tag
        temp = Double(currentTemp + String(number))!
        resultLabel.text = printFormatter.string(from: NSNumber(value: temp))

        sender.shine()
    }

    // Clear values
    private func clear() {
        operation = .none
        operatorAC.setTitle("AC", for: .normal)

        if temp != 0 {
            temp = 0
            resultLabel.text = "0"
        }
        else {
            total = 0
            result()
        }
    }

    // Obtain final result
    private func result() {
        switch operation {
        case .none:
            // Nothing to do here
            break
        case .addition:
            total += temp
            break
        case .substraction:
            total -= temp
            break
        case .multiplication:
            total *= temp
            break
        case .division:
            total /= temp
            break
        case .percent:
            temp = temp / 100
            total = temp
            break
        }

        // Screen formatting
        if let currentTotal = auxFormatter.string(from: NSNumber(value: total)), currentTotal.count > kMaxLength {
            resultLabel.text = printScientificFormatter.string(from: NSNumber(value: total))
        } else {
            resultLabel.text = printFormatter.string(from: NSNumber(value: total))
        }

        print("TOTAL: \(total)")
    }

}
