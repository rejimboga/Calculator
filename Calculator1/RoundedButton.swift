//
//  RoundedButton.swift
//  Calculator1
//
//  Created by Macbook Air on 17.11.2021.
//

import Foundation
import UIKit

class RoundedButton: UIButton {
    override func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = 30
    }
}
