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
    var delegate: BarChartDelegate?
    
    //Listens for user taps on screen
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)

        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(onTapped(_:)))
        self.addGestureRecognizer(tapRecognizer)
    }
    
    
    override func draw(_ rect: CGRect) {
        
        if let dataSource = self.dataSource{
            
            let numberOfItems = dataSource.numberOfItemsInChart()
     
            let linesPath = UIBezierPath()
            
            if numberOfItems > 0 {
            
                let itemWidth = self.bounds.size.width / CGFloat(numberOfItems)
                let maxHeight = self.bounds.size.height
                
                
                for index in 0..<numberOfItems {
                    
                    let itemHeight = maxHeight * CGFloat(dataSource.percentForItemsAtIndex(index))
                
                    let itemRect = CGRect(x: CGFloat(index) * itemWidth, y: maxHeight - itemHeight, width: itemWidth, height: itemHeight)
                    
                    dataSource.colorForItemAtIndex(index).set()
                    
                    let itemPath = UIBezierPath(rect: itemRect)
                    itemPath.fill()
                    
                    //Draws Vertical Lines
                    linesPath.move(to: CGPoint(x: CGFloat(index) * itemWidth, y: 0))
                    linesPath.addLine(to: CGPoint(x: CGFloat(index) * itemWidth, y: maxHeight))
                }
                //draws horizontal lines
                let numberOfYLines = 4
                for y in  1..<5{
                    
                    let yPoint = CGFloat(y) / CGFloat(numberOfYLines) * CGFloat(maxHeight)
                    linesPath.move(to: CGPoint(x: 0, y: yPoint))
                    linesPath.addLine(to: CGPoint(x: self.bounds.size.width, y: CGFloat(yPoint)))
                }
                
                //Grid Line Information
                UIColor.black.setStroke()
                linesPath.lineWidth = 1.0
                linesPath.stroke()
            }
            
        }
        
    }
    
    
    func reloadData(){
        self.setNeedsDisplay()
    }
    
    @objc func onTapped(_ sender: UITapGestureRecognizer){
        //Touch State--
        if sender.state == .ended{
            
            //array of touch checker: want location of first touch
            if let dataSource = self.dataSource{
                let location = sender.location(ofTouch: 0, in: self)
                
                let numberOfItems = dataSource.numberOfItemsInChart()
                let itemWidth = self.bounds.size.width / CGFloat(numberOfItems)
                
                let index = Int((location.x / itemWidth).rounded(.down))
                
                delegate?.tappedItemAtIndex(index)
            }
            
        }
        
    }
    
    
}
