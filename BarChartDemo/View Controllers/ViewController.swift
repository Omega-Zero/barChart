//
//  ViewController.swift
//  BarChartDemo
//
//  Created by administrator on 3/4/19.
//  Copyright © 2019 Jeffrey Marple. All rights reserved.
//

import UIKit

class ViewController: UIViewController{

    var chartData = [MarkerInfo]()
    
    @IBOutlet weak var barChart: BarCharView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        chartData.append(MarkerInfo(percentLeft: 0.5, color: UIColor.red))
        chartData.append(MarkerInfo(percentLeft: 1.0, color: UIColor.blue))
        chartData.append(MarkerInfo(percentLeft: 0.3, color: UIColor.gray))
        chartData.append(MarkerInfo(percentLeft: 0.8, color: UIColor.green))
        chartData.append(MarkerInfo(percentLeft: 0.1, color: UIColor.purple))
        chartData.append(MarkerInfo(percentLeft: 0.2, color: UIColor.yellow))

        barChart.dataSource = self
    }


} //end class

extension ViewController: BarChartDataSource{
    func numberOfItemsInChart() -> Int {
        return chartData.count
    }
    
    func percentForItemsAtIndex(_ index: Int) -> Double {
        return chartData[index].percentLeft
    }
    
    func colorForItemAtIndex(_ index: Int) -> UIColor {
        return chartData[index].color
    }
    
    
}

