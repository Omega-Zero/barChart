//
//  BarCharView.swift
//  BarChartDemo
//
//  Created by administrator on 3/4/19.
//  Copyright © 2019 Jeffrey Marple. All rights reserved.
//

import UIKit

class BarCharView: UIView {

    var dataSource: BarChartDataSource?
    
    override func draw(_ rect: CGRect) {
        
        if let dataSource = self.dataSource{
            
            let numberOfItems = dataSource.numberOfItemsInChart()
     
            if numberOfItems > 0 {
            
                let itemWidth = self.bounds.size.width / CGFloat(numberOfItems)
                let maxHeight = self.bounds.size.height
                
                for index in 0..<numberOfItems {
                    
                    let itemHeight = maxHeight * CGFloat(dataSource.percentForItemsAtIndex(index))
                
                    let itemRect = CGRect(x: CGFloat(index) * itemWidth, y: maxHeight - itemHeight, width: itemWidth, height: itemHeight)
                    
                    dataSource.colorForItemAtIndex(index).set()
                    
                    let itemPath = UIBezierPath(rect: itemRect)
                    itemPath.fill()
                }
            }
            
        }
        
    }

}
