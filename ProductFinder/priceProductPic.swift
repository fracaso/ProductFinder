//
//  priceProductPic.swift
//  ProductFinder
//
//  Created by Aaron Kinney on 3/15/20.
//  Copyright © 2020 HarvardInc. All rights reserved.
//

import UIKit

class PriceProductPic: Comparable{
    var productName: String
    var productPrice: Double
    var productPic: UIImage
    var productDescription: String
    
    init(name: String, price: Double, pic: UIImage, desc: String ){
        self.productName = name
        self.productPrice = price
        self.productPic = pic
        self.productDescription = desc
    }
    
    static func ==(lhs: PriceProductPic, rhs: PriceProductPic) -> Bool {
        return lhs.productName == rhs.productName
    }

    static func <(lhs: PriceProductPic, rhs: PriceProductPic) -> Bool {
        return lhs.productName < rhs.productName
    }
    
}
