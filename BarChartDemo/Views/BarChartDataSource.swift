//
//  BarChartDataSource.swift
//  BarChartDemo
//
//  Created by administrator on 3/4/19.
//  Copyright © 2019 Jeffrey Marple. All rights reserved.
//

import Foundation
import UIKit

protocol BarChartDataSource {
    
    func numberOfItemsInChart() -> Int
    func percentForItemsAtIndex(_ index: Int) -> Double
    func colorForItemAtIndex(_ index: Int) -> UIColor

} //end protocol
