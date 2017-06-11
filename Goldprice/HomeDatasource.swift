//
//  HomeDatasource.swift
//  Goldprice
//
//  Created by Nguyen Trong Khoi on 6/11/17.
//  Copyright © 2017 Nguyen Trong Khoi. All rights reserved.
//

import Foundation

class HomeDatasource : Datasource{
    let goldPrices: [GoldPrice] = {
        let gold1 = GoldPrice(amount: 20, date: "10/07/2016")
        let gold2 = GoldPrice(amount: 21, date: "11/07/2016")
        let gold3 = GoldPrice(amount: 16, date: "12/07/2016")
        let gold4 = GoldPrice(amount: 30, date: "13/07/2016")
        
        return [gold1, gold2, gold3, gold4]
    }()
    
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


