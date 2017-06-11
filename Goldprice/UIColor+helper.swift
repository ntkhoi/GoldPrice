//
//  UIColor+helper.swift
//  Goldprice
//
//  Created by Nguyen Trong Khoi on 6/11/17.
//  Copyright © 2017 Nguyen Trong Khoi. All rights reserved.
//


import Foundation
import UIKit

extension UIColor {
    
    convenience public init(r: CGFloat, g: CGFloat, b: CGFloat) {
        self.init(r: r, g: g, b: b, a: 1)
    }
    
    convenience public init(r: CGFloat, g: CGFloat, b: CGFloat, a: CGFloat) {
        self.init(red: r/255, green: g/255, blue: b/255, alpha: a)
    }
    
}
enum AppConfig {
    static let fontName: String = "Myriad Pro"
}

enum AppColor{
    static let NavTitle = UIColor(r: 15, g: 133, b: 209)
    static let collectionViewBg = UIColor(r: 220, g: 242, b: 255)
    static let NavBorder = UIColor(r: 157, g: 205, b: 236)
    
}
