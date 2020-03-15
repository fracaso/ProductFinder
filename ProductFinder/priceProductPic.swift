//
//  priceProductPic.swift
//  ProductFinder
//
//  Created by Aaron Kinney on 3/15/20.
//  Copyright © 2020 HarvardInc. All rights reserved.
//

import UIKit

struct PriceProductPic{
    var productName: String
    var productPrice: Double
    var productPic: UIImage
    
    init(name: String, price: Double, pic: UIImage){
        self.productName = name
        self.productPrice = price
        self.productPic = pic
    }
    
}
