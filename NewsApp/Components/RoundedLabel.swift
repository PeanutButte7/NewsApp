
//
//  RoundLabel.swift
//  NewsApp
//
//  Created by Adam on 07/02/2020.
//  Copyright © 2020 Adam. All rights reserved.
//

import UIKit

@IBDesignable
class RoundedLabel: UILabel {

    @IBInspectable var radius: CGFloat {
        get {
            return 0
        }
        set {
            self.clipsToBounds = true
            self.layer.cornerRadius = newValue
        }
    }
}
