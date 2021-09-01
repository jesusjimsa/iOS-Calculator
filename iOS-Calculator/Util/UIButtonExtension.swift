//
//  UIButtonExtension.swift
//  iOS-Calculator
//
//  Created by Jesús Jiménez Sánchez on 7/7/21.
//

import UIKit

private let orange = UIColor(red: 254/255, green: 148/255, blue: 0/255, alpha: 1)

// MARK: - UIButton Extension
extension UIButton {

    // Round edge
    func round() {
        layer.cornerRadius = bounds.height / 2
        clipsToBounds = true
    }

    // Shine on click
    func shine() {
        UIView.animate(withDuration: 0.1, animations: {
            self.alpha = 0.5
        }) { (completion) in
            UIView.animate(withDuration: 0.1, animations: {
                self.alpha = 1
            })
        }
    }

    // Choose how to show the ooperation button
    func selectOperation(_ selected: Bool) {
        backgroundColor = selected ? .white : orange
        setTitleColor(selected ? orange : .white, for: .normal)
    }

}
