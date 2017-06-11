//
//  HomeDatasourceController.swift
//  Goldprice
//
//  Created by Nguyen Trong Khoi on 6/11/17.
//  Copyright © 2017 Nguyen Trong Khoi. All rights reserved.
//


import UIKit


class HomeDatasourceController: DatasourceController{
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = AppColor.collectionViewBg
        self.collectionView?.backgroundColor = UIColor.white
        
        self.collectionView?.layer.borderWidth = 2
        self.collectionView?.layer.borderColor = AppColor.NavBorder.cgColor
        
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        self.collectionView?.collectionViewLayout = layout
        
        if #available(iOS 9.0, *) {
            self.collectionView?.anchor(self.view.topAnchor, left: self.view.leftAnchor, bottom: self.view.bottomAnchor, right: self.view.rightAnchor, topConstant: 100, leftConstant: 20, bottomConstant: 0, rightConstant: 20, widthConstant: 0, heightConstant: 0)
        } else {
            // Fallback on earlier versions
        }
        let homeDatasource = HomeDatasource()
        self.datasource = homeDatasource
        setupNavigationBarItems()
    }
    
    override func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.view.frame.width, height: 50)
    }
    
    
    
}


