//
//  Extension+UILabel.swift
//  MagneticTestBulgakov
//
//  Created by Dima on 22.04.2024.
//

import UIKit

extension UILabel {
    static func customLabel(text: String, textColor: UIColor, font: UIFont) -> UILabel {
        let label = UILabel()
        label.text = text
        label.textColor = textColor
        label.font = font
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }
}
