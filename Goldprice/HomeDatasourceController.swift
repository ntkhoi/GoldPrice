//
//  HomeDatasourceController.swift
//  Goldprice
//
//  Created by Nguyen Trong Khoi on 6/11/17.
//  Copyright © 2017 Nguyen Trong Khoi. All rights reserved.
//


import UIKit
import PopupDialog



class HomeDatasourceController: DatasourceController{
    
    let topContentView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.white
        return view
    }()
    
    let dayLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 40)
        label.text = "12"
        label.textColor = AppColor.NavTitle
        return label
    }()
    var weekDayLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = .boldSystemFont(ofSize: 15)
        label.text = "Tuesday"
        label.textColor = AppColor.NavTitle
        return label
    }()
    
    let monthLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 13)
        label.text = "June"
        label.textColor = AppColor.NavTitle
        return label
    }()
    
    let yearLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 13)
        label.text = "2017"
        label.textColor = AppColor.NavTitle
        return label
    }()
    
    var currentDate: [TimeUnit: String] = [:]
    
    var lineChart: LineChart!
    //Defaul data for linechar
    var goldAmouts: [CGFloat] = [0,0,0,0]
    
    var infoPopup: PopupDialog!
    
    let refreshControl = UIRefreshControl()
    
    lazy var networkErrorLabel: UILabel = {
        let label = UILabel()
        label.textColor = AppColor.NavTitle
        label.numberOfLines = 0
        label.textAlignment = .center
        label.text = "Unable to contact Gold Price server \nTry again"
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupScene()
        setupCollectionLayout()
        setupNavigationBarItems()
        setupLineChart()
        setupCurrenViewData()
        setupPopupDialog()
        setupConnectionError()
        refreshControl.addTarget(self, action: #selector(HomeDatasourceController.fetchData), for: UIControlEvents.valueChanged)
        self.collectionView?.insertSubview(refreshControl, at: 0)
        fetchData()
        
    }
    
    override func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.view.frame.width, height: 50)
    }
    
    func onShowInfoPopup(_ button: UIButton){
        setupPopupDialog()
    }
    
    private func setupCurrenViewData(){
        currentDate = getCurrentDayFormated()
        dayLabel.text = currentDate[.Day]
        weekDayLabel.text = currentDate[.Weekday]
        monthLabel.text = currentDate[.Month]
        
        
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
    
    @objc fileprivate func fetchData(){
        print("Start")
        Service.shareInstance.fetchGoldPrice {  [weak self] (homedataSoure, err) in
            if let _ = err {
                // Handle Network Error
                
                self?.networkErrorLabel.isHidden = false
                self?.datasource = nil
//                self?.lineChart.clear()
                self?.refreshControl.endRefreshing()
                print("Fetch Data error")
                return;
            }
            print("Fetch Data Success")
            self?.networkErrorLabel.isHidden = true
            self?.datasource = homedataSoure
            self?.lineChart.clear()
            self?.goldAmouts = (homedataSoure?.goldPrices.map{ CGFloat($0.amount) })!
            self?.lineChart.addLine((self?.goldAmouts)!)
            self?.refreshControl.endRefreshing()
            
            
        }
    }
    
    fileprivate func setupScene(){
        self.view.addSubview(topContentView)
        self.view.addSubview(dayLabel)
        self.view.addSubview(weekDayLabel)
        self.view.addSubview(monthLabel)
        self.view.addSubview(yearLabel)
        
        
        if #available(iOS 9.0, *) {
            self.collectionView?.anchor(self.view.topAnchor, left: self.view.leftAnchor, bottom: self.view.bottomAnchor, right: self.view.rightAnchor, topConstant: 260, leftConstant: 20, bottomConstant: 0, rightConstant: 20, widthConstant: 0, heightConstant: 0)
            self.topContentView.anchor(self.view.topAnchor, left: self.view.leftAnchor, bottom: self.collectionView?.topAnchor, right: self.view.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 20, rightConstant: 0, widthConstant: 0, heightConstant: 0)
            self.dayLabel.anchor(self.view.topAnchor, left: self.view.leftAnchor, bottom: nil, right: nil, topConstant: 10, leftConstant: 20, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
            self.weekDayLabel.anchor(self.dayLabel.topAnchor, left: self.dayLabel.rightAnchor, bottom: nil, right: nil, topConstant: 8, leftConstant: 10, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
            self.monthLabel.anchor(self.weekDayLabel.bottomAnchor, left: self.weekDayLabel.leftAnchor, bottom: nil, right: nil, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
            self.yearLabel.anchor(self.monthLabel.topAnchor, left: self.monthLabel.rightAnchor, bottom: nil, right: nil, topConstant: 0, leftConstant: 4, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
            
        } else {
            setupConstrainSupportUIS8()
        }
    }
    

    fileprivate func setupLineChart(){
        
        lineChart = LineChart()
        lineChart.animation.enabled = true
        lineChart.area = true
        lineChart.x.labels.visible = true
        lineChart.x.grid.count = 5
        lineChart.y.grid.count = 5
        lineChart.y.labels.visible = true
        lineChart.addLine(goldAmouts)
        lineChart.area = false
        lineChart.x.grid.visible = false
        lineChart.x.labels.visible = false
        lineChart.y.grid.visible = false
        lineChart.y.labels.visible = false
        
        lineChart.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(lineChart)
        if #available(iOS 9.0, *) {
            lineChart.anchor(self.dayLabel.bottomAnchor, left: self.topContentView.leftAnchor, bottom: self.topContentView.bottomAnchor, right: self.topContentView.rightAnchor, topConstant: 0, leftConstant: 10, bottomConstant: 10, rightConstant: 10, widthConstant: 0, heightConstant: 0)
        } else {
            setupLineChartConstrain()
        }
    }
    fileprivate func setupPopupDialog(){
        
        let vc = InfoPopupViewController(nibName: nil, bundle: nil)
        let popup = PopupDialog(viewController: vc, gestureDismissal: false) {
            
        }
        let cancel = DefaultButton(title: "Close") {
        }
        popup.addButton(cancel)
        present(popup, animated: true, completion: nil)
    }
    
    fileprivate func setupConnectionError(){
        self.collectionView?.addSubview(networkErrorLabel)
        networkErrorLabel.isHidden = false
        networkErrorLabel.anchorCenterXToSuperview()
        networkErrorLabel.anchorCenterYToSuperview()
    }
    
}


