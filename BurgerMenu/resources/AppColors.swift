//
//  AppColors.swift
//  BurgerMenu
//
//  Created by KsArT on 07.06.2024.
//

import UIKit

enum AppColors: String {
    case accent = "AccentColor"
    case darkBlue = "DarkBlueColor"
    case darkGreen = "DarkGreenColor"
    case darkRed = "DarkRedColor"
    case darkYellow = "DarkYellowColor"
    case lightBlue = "LightBlueColor"
    case lightGrayBlue = "LightGrayBlueColor"
    case lightYellow = "LightYellowColor"
    case mainBlue = "MainBlueColor"
    case mainYellow = "MainYellowColor"
}

extension AppColors {
    func cgColor(alpha: Double = 1) -> CGColor {
       self.uiColor(alpha: alpha).cgColor
    }

    func uiColor(alpha: Double = 1) -> UIColor {
        (UIColor(named: self.rawValue) ?? UIColor.clear).withAlphaComponent(CGFloat(alpha))
    }
}
