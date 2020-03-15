//
//  ViewController.swift
//  ProductFinder
//
//  Created by Aaron Kinney on 3/14/20.
//  Copyright © 2020 HarvardInc. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
     let cellTableIdentifier = "CellTableIdentifier"
    
    @IBOutlet weak var tableView: UITableView!
   

    let productMaster: [PriceProductPic] = [PriceProductPic(name: "Beets", price: 3.00, pic: UIImage(named: "beet")!), PriceProductPic(name: "Carrots", price: 3.00, pic: UIImage(named: "carrot")!), PriceProductPic(name: "Corn", price: 5.00, pic: UIImage(named: "corn")!), PriceProductPic(name: "Broccoli", price: 1.00, pic: UIImage(named: "broccoli")!)]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tableView.register(TableCell.self, forCellReuseIdentifier: cellTableIdentifier)
        let xib = UINib(nibName: "TableCell", bundle: nil)
        
        tableView.register(xib, forCellReuseIdentifier: cellTableIdentifier)
        tableView.rowHeight = 66 }

 
    // MARK: Table View Data Source Methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         
        return productMaster.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell( withIdentifier: cellTableIdentifier, for: indexPath) as! TableCell
        let rowData = productMaster[indexPath.row]
        
        cell.productItem = rowData.productName
        cell.productPrice = rowData.productPrice
        cell.productPicture = rowData.productPic
        
        return cell
        
    }
 

}
