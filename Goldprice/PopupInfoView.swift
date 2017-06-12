//
//  PopupInfoView.swift
//  Goldprice
//
//  Created by Nguyen Trong Khoi on 6/12/17.
//  Copyright © 2017 Nguyen Trong Khoi. All rights reserved.
//

import Foundation
import UIKit
class PopupInfoView : UIView{
    // The title label
    
    lazy var titleLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor(red: 0.25, green: 0.53, blue: 0.91, alpha: 1)
        label.textAlignment = .center
        return label
    }()
    
    let contentView : UIView = {
        let view = UIView()
        return view
    }()
    
    let nameLabel: UILabel = {
       let label = UILabel()
        label.text = "Nguyen Trong Khoi"
        label.textAlignment = .center
        label.textColor = AppColor.NavTitle
        return label
    }()
    
    let emailLabel: UILabel = {
        let label = UILabel()
        label.text = "ntkhoiptit@gmail.com"
        label.textAlignment = .center
        label.textColor = AppColor.NavTitle
        return label
    }()
    
    lazy var profileImage: UIImageView = {
        let imageView = UIImageView()
        
        imageView.image = #imageLiteral(resourceName: "user_info")
        imageView.frame = CGRect(x: 0, y: 0, width: 80, height: 80)
        return imageView
        
    }()
    
    override func didMoveToSuperview() {
        super.didMoveToSuperview()
        addSubview(titleLabel)
        addSubview(contentView)
        addSubview(nameLabel)
        addSubview(profileImage)
        addSubview(emailLabel)
        
//        self.translatesAutoresizingMaskIntoConstraints = false;
        if #available(iOS 9.0, *) {
            heightAnchor.constraint(equalToConstant: 220).isActive = true
            contentView.anchor(self.topAnchor, left: self.leftAnchor, bottom: self.bottomAnchor, right: self.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
            profileImage.anchor(self.contentView.topAnchor , left: self.contentView.leftAnchor, bottom: nil, right: nil ,topConstant: 10, leftConstant: 110, bottomConstant: 0, rightConstant: 0, widthConstant: 80, heightConstant: 80)
            nameLabel.anchor(profileImage.bottomAnchor, left: self.leftAnchor, bottom: nil, right: nil, topConstant: 20, leftConstant: 80, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
            emailLabel.anchor(self.nameLabel.topAnchor, left: self.leftAnchor, bottom: nil, right: nil, topConstant: 40, leftConstant: 70, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
            
        }else{
            setupPopupIos8()
        }
    }
    
    private func setupPopupIos8(){
        profileImage.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        emailLabel.translatesAutoresizingMaskIntoConstraints = false
        var constraints = [NSLayoutConstraint]()
        let views: [String: UIView] = ["title": titleLabel, "view": contentView , "name": nameLabel , "profile": profileImage , "email": emailLabel , "self" : self]
        constraints += NSLayoutConstraint.constraints(withVisualFormat: "V:[self(>=220)]", options: [], metrics: nil, views: views)
        constraints += NSLayoutConstraint.constraints(withVisualFormat: "H:|-120-[profile(==80)]", options: [], metrics: nil, views: views)
        constraints += NSLayoutConstraint.constraints(withVisualFormat: "V:|-10-[profile(==80)]-20-[name]-20-[email]", options: [], metrics: nil, views: views)
        constraints += NSLayoutConstraint.constraints(withVisualFormat: "H:|-0-[name]|", options: [], metrics: nil, views: views)
        constraints += NSLayoutConstraint.constraints(withVisualFormat: "H:|-0-[email]|", options: [], metrics: nil, views: views)
        NSLayoutConstraint.activate(constraints)
    }
    
}
