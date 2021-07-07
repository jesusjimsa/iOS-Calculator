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
    @IBOutlet weak var result_label: UILabel!

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
    @IBOutlet weak var number_decimal: UIButton!

    // Operator
    @IBOutlet weak var operator_AC: UIButton!
    @IBOutlet weak var operator_plus_minus: UIButton!
    @IBOutlet weak var operator_module: UIButton!
    @IBOutlet weak var operator_division: UIButton!
    @IBOutlet weak var operator_multiplication: UIButton!
    @IBOutlet weak var operator_substraction: UIButton!
    @IBOutlet weak var operator_addition: UIButton!
    @IBOutlet weak var operator_result: UIButton!


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
        number_decimal.round()

        operator_AC.round()
        operator_plus_minus.round()
        operator_module.round()
        operator_division.round()
        operator_multiplication.round()
        operator_substraction.round()
        operator_addition.round()
        operator_result.round()


    }

    // MARK: - Buttons Actions

    @IBAction func operator_AC_Action(_ sender: UIButton) {
        sender.shine()
    }

    @IBAction func operator_plus_minus_Action(_ sender: UIButton) {
        sender.shine()
    }

    @IBAction func operator_module_Action(_ sender: UIButton) {
        sender.shine()
    }

    @IBAction func operator_division_Action(_ sender: UIButton) {
        sender.shine()
    }

    @IBAction func operator_multiplication_Action(_ sender: UIButton) {
        sender.shine()
    }

    @IBAction func operator_substraction_Action(_ sender: UIButton) {
        sender.shine()
    }

    @IBAction func operator_addition_Action(_ sender: UIButton) {
        sender.shine()
    }

    @IBAction func operator_result_Action(_ sender: UIButton) {
        sender.shine()
    }

    @IBAction func number_decimal_Action(_ sender: UIButton) {
        sender.shine()
    }

    @IBAction func number_Action(_ sender: UIButton) {
        sender.shine()
        print(sender.tag)
    }

}
