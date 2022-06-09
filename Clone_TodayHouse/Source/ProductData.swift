//
//  ProductData.swift
//  Clone_TodayHouse
//
//  Created by 장석우 on 2022/06/10.
//

import Foundation
import UIKit
struct ProductData{
    var productImageName : String
    var productName : String
    
    func setProductImage() -> UIImage?{
        return UIImage(named: productImageName)
    }
}
