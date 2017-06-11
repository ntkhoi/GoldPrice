//
//  HomeDatasourceController.swift
//  Goldprice
//
//  Created by Nguyen Trong Khoi on 6/11/17.
//  Copyright © 2017 Nguyen Trong Khoi. All rights reserved.
//


import UIKit


class HomeDatasourceController: DatasourceController{
    
    let topContentView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.white
        return view
    }()
    
    fileprivate let dayLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 40)
        label.text = "12"
        label.textColor = AppColor.NavTitle
        return label
    }()
    fileprivate let weekDayLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = .boldSystemFont(ofSize: 15)
        label.text = "Tuesday"
        label.textColor = AppColor.NavTitle
        return label
    }()
    
    fileprivate let monthLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 13)
        label.text = "June"
        label.textColor = AppColor.NavTitle
        return label
    }()
    
    fileprivate let yearLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 13)
        label.text = "2017"
        label.textColor = AppColor.NavTitle
        return label
    }()

    var lineChart: LineChart!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        var views: [String: AnyObject] = [:]
        
        label.text = "..."
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = NSTextAlignment.center
        self.view.addSubview(label)
        views["label"] = label
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-[label]-|", options: [], metrics: nil, views: views))
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-80-[label]", options: [], metrics: nil, views: views))
        
        // simple arrays
        let data: [CGFloat] = [3, 4, -2, 11, 13, 15]
        let data2: [CGFloat] = [1, 3, 5, 13, 17, 20]
        
        // simple line with custom x axis labels
        let xLabels: [String] = ["Jan", "Feb", "Mar", "Apr", "May", "Jun"]
        
        lineChart = LineChart()
        lineChart.animation.enabled = true
        lineChart.area = true
        lineChart.x.labels.visible = true
        lineChart.x.grid.count = 5
        lineChart.y.grid.count = 5
        lineChart.x.labels.values = xLabels
        lineChart.y.labels.visible = true
        lineChart.addLine(data)
        lineChart.addLine(data2)
        
        lineChart.translatesAutoresizingMaskIntoConstraints = false
        lineChart.delegate = self
        self.view.addSubview(lineChart)
        views["chart"] = lineChart
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-[chart]-|", options: [], metrics: nil, views: views))
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:[label]-[chart(==200)]", options: [], metrics: nil, views: views))
        
        setupScene()
        setupCollectionLayout()
        setupNavigationBarItems()
        fetchData()
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.view.frame.width, height: 50)
    }
}

extension HomeDatasourceController {
    
    fileprivate func setupCollectionLayout(){
        self.view.backgroundColor = AppColor.collectionViewBg
        self.collectionView?.backgroundColor = UIColor.white
        self.collectionView?.layer.borderWidth = 2
        self.collectionView?.layer.borderColor = AppColor.NavBorder.cgColor
        
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        self.collectionView?.collectionViewLayout = layout
    }
    
    fileprivate func fetchData(){
        Service.shareInstance.fetchGoldPrice { (homedataSoure, err) in
            if let _ = err {
                // Handle Network Error
                return;
            }
            self.datasource = homedataSoure
        }
    }
    
    fileprivate func setupScene(){
        self.view.addSubview(topContentView)
        self.view.addSubview(dayLabel)
        self.view.addSubview(weekDayLabel)
        self.view.addSubview(monthLabel)
        self.view.addSubview(yearLabel)
        
        if #available(iOS 9.0, *) {
            self.collectionView?.anchor(self.view.topAnchor, left: self.view.leftAnchor, bottom: self.view.bottomAnchor, right: self.view.rightAnchor, topConstant: 240, leftConstant: 20, bottomConstant: 0, rightConstant: 20, widthConstant: 0, heightConstant: 0)
            self.topContentView.anchor(self.view.topAnchor, left: self.view.leftAnchor, bottom: self.collectionView?.topAnchor, right: self.view.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 20, rightConstant: 0, widthConstant: 0, heightConstant: 0)
            self.dayLabel.anchor(self.view.topAnchor, left: self.view.leftAnchor, bottom: nil, right: nil, topConstant: 10, leftConstant: 20, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
            self.weekDayLabel.anchor(self.dayLabel.topAnchor, left: self.dayLabel.rightAnchor, bottom: nil, right: nil, topConstant: 8, leftConstant: 10, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
            self.monthLabel.anchor(self.weekDayLabel.bottomAnchor, left: self.weekDayLabel.leftAnchor, bottom: nil, right: nil, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
            self.yearLabel.anchor(self.monthLabel.topAnchor, left: self.monthLabel.rightAnchor, bottom: nil, right: nil, topConstant: 0, leftConstant: 4, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
            
        } else {
            
        }
    }
}


