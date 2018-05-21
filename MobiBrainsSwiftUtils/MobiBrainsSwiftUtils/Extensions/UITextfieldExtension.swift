//
//  UITextfieldExtension.swift
//  RestaurantOwner
//
//  Created by MobiBrains Technologies on 4/8/17.
//  Copyright © 2017 MobiBrains Technologies. All rights reserved.
//

import Foundation
import UIKit

extension UITextField {
    
    func addUnderline(withColor color:UIColor) {
        let border = CALayer()
        let borderWidth = CGFloat(1.0)
        border.borderColor = color.cgColor
        
        self.setNeedsLayout()
        self.layoutIfNeeded()
        
        border.frame = CGRect(x:0, y:self.frame.size.height - borderWidth, width:self.frame.size.width, height:self.frame.size.height)
        border.borderWidth = borderWidth
        self.layer.addSublayer(border)
        self.layer.masksToBounds = true
    }
    
    func setBottomBorder(withColor color:UIColor) {
        self.borderStyle = .none
        self.layer.backgroundColor = UIColor.clear.cgColor
        self.layer.masksToBounds = false
        self.layer.shadowColor = color.cgColor
        self.layer.shadowOffset = CGSize(width: 0.0, height: 1.0)
        self.layer.shadowOpacity = 1.0
        self.layer.shadowRadius = 0.0
    }
}
