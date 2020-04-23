//
//  pricesView.swift
//  ProductFinder
//
//  Created by Aaron Kinney on 4/19/20.
//  Copyright © 2020 HarvardInc. All rights reserved.
//

import UIKit

class pricesView: UIView {
    
    @IBOutlet weak var priceView: pricesView!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        UINib(nibName: "priceView" , bundle: nil).instantiate(withOwner: self, options: nil )
    addSubview(priceView)
    priceView.frame = self.bounds
    }

}
