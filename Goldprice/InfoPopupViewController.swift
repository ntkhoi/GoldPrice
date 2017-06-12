//
//  InfoPopupViewController.swift
//  Goldprice
//
//  Created by Nguyen Trong Khoi on 6/12/17.
//  Copyright © 2017 Nguyen Trong Khoi. All rights reserved.
//

import UIKit
import PopupDialog

class InfoPopupViewController: UIViewController {

    
    fileprivate var baseView: PopupInfoView {
        return view as! PopupInfoView
    }
    
    override func loadView() {
        view = PopupInfoView()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        baseView.titleLabel.text = "User Profile"
    }
}

