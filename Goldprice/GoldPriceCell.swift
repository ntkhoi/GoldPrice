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
    
    fileprivate let amountLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .right
        label.textColor = AppColor.NavTitle
        label.text = ""
        label.font = UIFont.boldSystemFont(ofSize: 16)
        return label
    }()
    
    fileprivate let dateLabel: UILabel = {
        let label = UILabel()
        label.textColor = AppColor.NavTitle
        label.textAlignment = .left
        label.text = ""
        label.font = UIFont.boldSystemFont(ofSize: 16)
        return label
    }()
    
    fileprivate let separatorView: UIView = {
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
         setupCelllayoutIos8()
        }
    }
}



// IOS 8 setup View
extension GoldPriceCell{
    
    fileprivate func setupCelllayoutIos8(){
        self.dateLabel.translatesAutoresizingMaskIntoConstraints = false
        self.amountLabel.translatesAutoresizingMaskIntoConstraints = false
        self.separatorView.translatesAutoresizingMaskIntoConstraints = false
        
        let viewsDict = ["dateLabel": dateLabel , "amountLabel" : amountLabel ,
                         "separatorView": separatorView
            ] as [String : Any]
        
        
        var viewConstraints = [NSLayoutConstraint]()
        viewConstraints += NSLayoutConstraint.constraints(withVisualFormat: "H:|-40-[dateLabel]|", options: [], metrics: nil, views: viewsDict)
        viewConstraints +=  NSLayoutConstraint.constraints(withVisualFormat: "V:|-23-[dateLabel]", options: [], metrics: nil, views: viewsDict)
        viewConstraints += NSLayoutConstraint.constraints(withVisualFormat: "H:|[amountLabel]-40-|", options: [], metrics: nil, views: viewsDict)
        viewConstraints += NSLayoutConstraint.constraints(withVisualFormat: "V:|-23-[amountLabel]", options: [], metrics: nil, views: viewsDict)
        viewConstraints += NSLayoutConstraint.constraints(withVisualFormat: "H:|-23-[separatorView]-0-|", options: [], metrics: nil, views: viewsDict)
        viewConstraints += NSLayoutConstraint.constraints(withVisualFormat: "V:[separatorView(==1)]-0-|", options: [], metrics: nil, views: viewsDict)
        
        
        NSLayoutConstraint.activate(viewConstraints)
        
    }
}
