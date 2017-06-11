//
//  GoldPriceCell.swift
//  Goldprice
//
//  Created by Nguyen Trong Khoi on 6/11/17.
//  Copyright © 2017 Nguyen Trong Khoi. All rights reserved.
//

import UIKit

class GoldPriceCell: DatasourceCell{
    
    override var datasourceItem: Any? {
        didSet {
            guard let goldPrice = datasourceItem as? GoldPrice else { return }
            amountLabel.text = String(goldPrice.amount)
            dateLabel.text = String(goldPrice.date)
        }
    }
    
    private let amountLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .right
        label.textColor = AppColor.NavTitle
        label.text = ""
        label.font = UIFont.boldSystemFont(ofSize: 16)
        return label
    }()
    
    private let dateLabel: UILabel = {
        let label = UILabel()
        label.textColor = AppColor.NavTitle
        label.textAlignment = .left
        label.text = ""
        label.font = UIFont.boldSystemFont(ofSize: 16)
        return label
    }()
    
    private let separatorView: UIView = {
        let uiview = UIView()
        uiview.backgroundColor = AppColor.NavTitle
        
        return uiview
    }()
    
    
    override func setupViews() {
        super.setupViews()
        addSubview(amountLabel)
        addSubview(dateLabel)
        addSubview(separatorView)
        
        if #available(iOS 9.0, *) {
            dateLabel.anchor(nil, left: self.leftAnchor, bottom: nil, right: nil, topConstant: 0, leftConstant: 40, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
            amountLabel.anchor(nil, left: nil, bottom: nil, right: self.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 40, widthConstant: 0, heightConstant: 0)
            
            separatorView.anchor(nil, left: dateLabel.leftAnchor, bottom: self.bottomAnchor, right: self.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 1)
            amountLabel.anchorCenterYToSuperview(constant: 0)
            dateLabel.anchorCenterYToSuperview(constant: 0)
            
        } else {
            // Fallback on earlier versions
        }
    }
}
