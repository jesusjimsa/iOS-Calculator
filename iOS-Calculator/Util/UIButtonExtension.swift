//
//  UIButtonExtension.swift
//  iOS-Calculator
//
//  Created by Jesús Jiménez Sánchez on 7/7/21.
//

import UIKit

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

}
