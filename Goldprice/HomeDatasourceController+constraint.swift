//
//  HomeDatasourceController+constraint.swift
//  Goldprice
//
//  Created by Nguyen Trong Khoi on 6/12/17.
//  Copyright © 2017 Nguyen Trong Khoi. All rights reserved.
//

import Foundation
import UIKit


// Setup auto layout for IOS8 .
// For IOS 8 only . From IOS 9 use auto layout by anchor is easier

extension HomeDatasourceController {
    
     func setupConstrainSupportUIS8(){
        removeconstraintInterfaceBuilder()
        let viewsDict = ["cl": collectionView , "tcv" : topContentView ,
                         "daylb": dayLabel , "wdlabel": weekDayLabel,
                         "monthlabel": monthLabel , "yearLabel" : yearLabel
            ] as [String : Any]
        var viewConstraints = [NSLayoutConstraint]()
        let topContentViewConstraintsHorizontal = NSLayoutConstraint.constraints(withVisualFormat: "H:|-0-[tcv]-0-|", options: [], metrics: nil, views: viewsDict)
        viewConstraints += topContentViewConstraintsHorizontal
        
        let collectionViewConstraintsHorizontal = NSLayoutConstraint.constraints(withVisualFormat: "H:|-20-[cl]-20-|", options: [], metrics: nil, views: viewsDict)
        viewConstraints += collectionViewConstraintsHorizontal
        
        let verticalCollectionviewConstraints = NSLayoutConstraint.constraints(withVisualFormat: "V:|-200-[cl]-0-|", options: [], metrics: nil, views: viewsDict)
        viewConstraints += verticalCollectionviewConstraints
        
        let verticalViewContentConstraints = NSLayoutConstraint.constraints(withVisualFormat: "V:|-0-[tcv]-20-[cl]", options: [], metrics: nil, views: viewsDict)
        
        viewConstraints += verticalViewContentConstraints
        
        let dayLabelViewConstraintsHorizontal = NSLayoutConstraint.constraints(withVisualFormat: "H:|-20-[daylb]", options: [], metrics: nil, views: viewsDict)
        
        viewConstraints += dayLabelViewConstraintsHorizontal
        let dayLabelverticalConstraints = NSLayoutConstraint.constraints(withVisualFormat: "V:|-10-[daylb]", options: [], metrics: nil, views: viewsDict)
        viewConstraints += dayLabelverticalConstraints
        
        let weekdayViewConstraintsHorizontal = NSLayoutConstraint.constraints(withVisualFormat: "H:[daylb]-10-[wdlabel]", options: [], metrics: nil, views: viewsDict)
        
        viewConstraints += weekdayViewConstraintsHorizontal
        
        let weekdayLabelverticalConstraints = NSLayoutConstraint.constraints(withVisualFormat: "V:|-10-[wdlabel]-3-[monthlabel]", options: [], metrics: nil, views: viewsDict)
        viewConstraints += weekdayLabelverticalConstraints
        
        
        let monthLabelViewConstraintsHorizontal = NSLayoutConstraint.constraints(withVisualFormat: "H:[daylb]-10-[monthlabel]-6-[yearLabel]", options: [], metrics: nil, views: viewsDict)
        viewConstraints += monthLabelViewConstraintsHorizontal
        
        let yearLabelverticalConstraints = NSLayoutConstraint.constraints(withVisualFormat: "V:|-10-[wdlabel]-3-[yearLabel]", options: [], metrics: nil, views: viewsDict)
        viewConstraints += yearLabelverticalConstraints
        
        NSLayoutConstraint.activate(viewConstraints)
        
        
    }

    func setupLineChartConstrain(){
        self.lineChart.translatesAutoresizingMaskIntoConstraints = false
        let viewsDict = ["cl": collectionView! , "tcv" : topContentView ,
                         "daylb": dayLabel , "wdlabel": weekDayLabel,
                         "monthlabel": monthLabel , "yearLabel" : yearLabel , "linechart": lineChart
            ] as [String : Any]
        
        var viewConstraints = [NSLayoutConstraint]()
        
        let linechartViewConstraintsHorizontal = NSLayoutConstraint.constraints(withVisualFormat: "H:|-10-[linechart]-10-|", options: [], metrics: nil, views: viewsDict)
        viewConstraints += linechartViewConstraintsHorizontal
        
        let linechartViewConstraintsVerticle = NSLayoutConstraint.constraints(withVisualFormat: "V:|-37-[linechart]-20-[cl]", options: [], metrics: nil, views: viewsDict)
        viewConstraints += linechartViewConstraintsVerticle
        NSLayoutConstraint.activate(viewConstraints)
    }
    
    
    private func removeconstraintInterfaceBuilder() {
        self.collectionView?.translatesAutoresizingMaskIntoConstraints = false
        self.topContentView.translatesAutoresizingMaskIntoConstraints = false
        self.dayLabel.translatesAutoresizingMaskIntoConstraints = false
        self.weekDayLabel.translatesAutoresizingMaskIntoConstraints = false
        self.monthLabel.translatesAutoresizingMaskIntoConstraints = false
        self.yearLabel.translatesAutoresizingMaskIntoConstraints = false
    }
    
}
