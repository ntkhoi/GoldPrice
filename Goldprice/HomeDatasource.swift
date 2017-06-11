//
//  HomeDatasource.swift
//  Goldprice
//
//  Created by Nguyen Trong Khoi on 6/11/17.
//  Copyright © 2017 Nguyen Trong Khoi. All rights reserved.
//

import Foundation
import TRON
import SwiftyJSON

class HomeDatasource : Datasource, JSONDecodable{
        
    let goldPrices: [GoldPrice]
    required init(json: JSON) throws {
        guard let goldPriceJsonArray = json.array else{
            throw NSError(domain: "goldprice", code: 1, userInfo: [NSLocalizedDescriptionKey: "Parsing JSON was not valid."])
        }
        self.goldPrices = goldPriceJsonArray.map{GoldPrice(json: $0)}
    }
    
    override func cellClasses() -> [DatasourceCell.Type] {
        return [GoldPriceCell.self]
    }
    
    override func item(_ indexPath: IndexPath) -> Any? {
        return goldPrices[indexPath.item]
    }
    
    override func numberOfItems(_ section: Int) -> Int {
        return goldPrices.count
    }
}


