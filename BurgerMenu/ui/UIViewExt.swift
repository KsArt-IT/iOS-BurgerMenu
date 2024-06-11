//
//  UIViewExt.swift
//  BurgerMenu
//
//  Created by KsArT on 07.06.2024.
//

import UIKit

extension UIButton {

    func applyGradient() {
        let color = AppColors.mainBlue.cgColor(alpha: 0.3)
        let centerColor = AppColors.mainBlue.cgColor(alpha: 0.21)

        let gradient = CAGradientLayer()

        gradient.frame = CGRect(x: 0, y: 0, width: 1000, height: self.frame.size.height)

        gradient.colors = [color, centerColor, color]
        gradient.startPoint = CGPoint(x: 0.5, y: 0)
        gradient.endPoint = CGPoint(x: 0.5, y: 1)
        gradient.locations = [-0.1, 0.5, 1.1]

        self.layer.addSublayer(gradient)
        self.layer.cornerRadius = cornerRadius
        self.clipsToBounds = true
    }
}

extension UIView {

    func applyBorderStyle() {
        self.layer.cornerRadius = cornerRadius
        self.layer.borderWidth = 1
        self.layer.borderColor = AppColors.darkBlue.cgColor(alpha: 0.3)
    }

    func animateCorner(){
        UIView.animate(withDuration: 0.5, delay: 0.5, options: [.autoreverse,.repeat]) { [weak self] in
            self?.layer.cornerRadius = cornerRadius
        }
    }
}
