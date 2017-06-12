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
        }
        setupTitleNavItem()
        setupLeftNavItem()
        
    }
    
    
    private func setupNavbarBottomborder(){
        let bottomBorderView  = UIView()
        bottomBorderView.backgroundColor = AppColor.NavBorder
        self.view.addSubview(bottomBorderView)
        bottomBorderView.translatesAutoresizingMaskIntoConstraints = false
        
        if #available(iOS 9.0, *) {
            bottomBorderView.anchor(self.view.topAnchor, left: self.view.leftAnchor, bottom: nil, right: self.view.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 2)
        } else {
            let viewsDict = [ "btview": bottomBorderView]
            var viewConstraints = [NSLayoutConstraint]()
            
            let bottomBorderViewConstraintsHorizontal = NSLayoutConstraint.constraints(withVisualFormat: "H:|-0-[btview]-0-|", options: [], metrics: nil, views: viewsDict)
            viewConstraints += bottomBorderViewConstraintsHorizontal
            
            let bottomBorderViewConstraintsVerticle = NSLayoutConstraint.constraints(withVisualFormat: "V:[btview(==2)]-0-|", options: [], metrics: nil, views: viewsDict)
            viewConstraints += bottomBorderViewConstraintsVerticle
            
            NSLayoutConstraint.activate(viewConstraints)
        }
        
    }
    
    private func setupTitleNavItem(){
        navigationItem.title = "RTH Gold Price"
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: AppColor.NavTitle]
    }
    
    private func setupLeftNavItem() {
        let infoButton = UIButton(type: .system)
        infoButton.setImage(#imageLiteral(resourceName: "info_icon").withRenderingMode(.alwaysOriginal), for: .normal)
        infoButton.frame = CGRect(x: 0, y: 0, width: 34, height: 34)
        infoButton.addTarget(self, action: #selector(HomeDatasourceController.onShowInfoPopup(_:)), for: .touchDown)

        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: infoButton)
        
    }
    
   
}
