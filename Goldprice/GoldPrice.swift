//
//  GoldPrice.swift
//  Goldprice
//
//  Created by Nguyen Trong Khoi on 6/11/17.
//  Copyright © 2017 Nguyen Trong Khoi. All rights reserved.
//

import Foundation
import SwiftyJSON
import TRON
struct GoldPrice :JSONDecodable {
    
    let amount: Float
    let date: String
    init(json: JSON) {
        self.amount = json["amount"].floatValue
        self.date = json["date"].stringValue
    }
}


