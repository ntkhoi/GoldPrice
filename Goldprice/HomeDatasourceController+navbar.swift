//
//  HomeDatasourceController+navbar.swift
//  Goldprice
//
//  Created by Nguyen Trong Khoi on 6/11/17.
//  Copyright © 2017 Nguyen Trong Khoi. All rights reserved.
//

import UIKit


extension HomeDatasourceController{

    func setupNavigationBarItems(){
     
        navigationController?.navigationBar.backgroundColor = .white
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        navigationController?.navigationBar.shadowImage = UIImage()
        
        if #available(iOS 9.0, *) {
            setupNavbarBottomborder()
        } else {
            // Fallback on earlier versions
        }
        setupTitleNavItem()
        setupLeftNavItem()
        
    }
    
    @available(iOS 9.0, *)
    private func setupNavbarBottomborder(){
        let bottomBorderView  = UIView()
        bottomBorderView.backgroundColor = AppColor.NavBorder
        //220,242,255
        self.view.addSubview(bottomBorderView)
        
        bottomBorderView.anchor(self.view.topAnchor, left: self.view.leftAnchor, bottom: nil, right: self.view.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 2)
        
    }
    
    private func setupTitleNavItem(){
        navigationItem.title = "RTH Gold Price"
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: AppColor.NavTitle]
    }
    
    private func setupLeftNavItem() {
        let followButton = UIButton(type: .system)
        followButton.setImage(#imageLiteral(resourceName: "info_icon").withRenderingMode(.alwaysOriginal), for: .normal)
        followButton.frame = CGRect(x: 0, y: 0, width: 34, height: 34)
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: followButton)
        
    }
}
