//
//  ViewController.swift
//  ProductFinder
//
//  Created by Aaron Kinney on 3/14/20.
//  Copyright © 2020 HarvardInc. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
     
    
     // Cell Identifier
     let cellTableIdentifier = "MonkeyBusiness"
    
    @IBOutlet weak var tableView: UITableView!
   
    // Product Master
    var productMaster: [PriceProductPic] = [
        PriceProductPic(name: "Romaine Lettuce", price: 3.00, pic: UIImage(named: "romaine")!,desc: ""),
        PriceProductPic(name: "Green Leaf Lettuce", price: 3.00, pic: UIImage(named: "greenleaflettuce")!,desc: ""),
        PriceProductPic(name: "Red Leaf Lettuce", price: 3.00, pic: UIImage(named: "redleaflettuce")!,desc: ""),
        PriceProductPic(name: "Red Beets", price: 3.00, pic: UIImage(named: "beet")!,desc: ""),
        PriceProductPic(name: "Golden Beets", price: 3.00, pic: UIImage(named: "beetgolden")!,desc: ""),
        PriceProductPic(name: "White Beets", price: 3.00, pic: UIImage(named: "beetwhite")!,desc: ""),
        PriceProductPic(name: "Radishes", price: 3.00, pic: UIImage(named: "radish")!,desc: ""),
        PriceProductPic(name: "Celery", price: 3.00, pic: UIImage(named: "celery")!,desc: ""),
        PriceProductPic(name: "White Turnips", price: 3.00, pic: UIImage(named: "turnipwhite")!,desc: ""),
        PriceProductPic(name: "Candy Onions", price: 3.00, pic: UIImage(named: "onioncandy")!,desc: ""),
        PriceProductPic(name: "Red Onions", price: 3.00, pic: UIImage(named: "onionred")!,desc: ""),
        PriceProductPic(name: "Green Onions", price: 3.00, pic: UIImage(named: "oniongreen")!,desc: ""),
        PriceProductPic(name: "Green Zucchini", price: 3.00, pic: UIImage(named: "zucchini")!,desc: ""),
        PriceProductPic(name: "Yellow Zucchini", price: 3.00, pic: UIImage(named: "zucchiniyellow")!,desc: ""),
        PriceProductPic(name: "Mexican Zucchini", price: 3.00, pic: UIImage(named: "zucchinimexicangrey")!,desc: ""),
        PriceProductPic(name: "Edamame", price: 3.00, pic: UIImage(named: "edamame")!,desc: ""),
        PriceProductPic(name: "Carrots", price: 3.00, pic: UIImage(named: "carrot")!,desc: ""),
        PriceProductPic(name: "Corn", price: 5.00, pic: UIImage(named: "corn")!,desc: ""),
        PriceProductPic(name: "Broccoli", price: 1.00, pic: UIImage(named: "broccoli")!, desc: "Broccoli is an edible green plant in the cabbage family (family Brassicaceae, genus Brassica) whose large flowering head and stalk is eaten as a vegetable. The word broccoli comes from the Italian plural of broccolo, which means 'the flowering crest of a cabbage', and is the diminutive form of brocco, meaning 'small nail' or 'sprout'. Broccoli is classified in the Italica cultivar group of the species Brassica oleracea. Broccoli has large flower heads, usually dark green in color, arranged in a tree-like structure branching out from a thick stalk which is usually light green. The mass of flower heads is surrounded by leaves. Broccoli resembles cauliflower, which is a different cultivar group of the same Brassica species."),
        PriceProductPic(name: "Cauliflower", price: 1.00, pic: UIImage(named: "cauliflower")!,desc: ""),
        PriceProductPic(name: "Green Pepper", price: 1.00, pic: UIImage(named: "peppergreen")!,desc: ""),
        PriceProductPic(name: "Carmen Sweet Pepper", price: 1.00, pic: UIImage(named: "peppercarmensweetred")!,desc: ""),
        PriceProductPic(name: "Jalapeno Pepper", price: 1.00, pic: UIImage(named: "pepperjalapeno")!,desc: ""),
        PriceProductPic(name: "Roma Tomato", price: 1.00, pic: UIImage(named: "tomatoroma")!,desc: ""),
        PriceProductPic(name: "Globe Tomato", price: 1.00, pic: UIImage(named: "tomatoglobe")!,desc: ""),
        PriceProductPic(name: "Heirloom Tomato", price: 1.00, pic: UIImage(named: "tomatoheirloom")!,desc: ""),
        PriceProductPic(name: "Sugar Cube Melon", price: 1.00, pic: UIImage(named: "melonsugarcube")!,desc: ""),
        PriceProductPic(name: "Athena Melon", price: 1.00, pic: UIImage(named: "melonathena")!,desc: ""),
        PriceProductPic(name: "Seeded Red Watermelon", price: 1.00, pic: UIImage(named: "watermelonseeded")!,desc: ""),
        PriceProductPic(name: "Seedless Red Watermelon", price: 1.00, pic: UIImage(named: "watermelonseedlessred")!,desc: ""),
        PriceProductPic(name: "Seedless Orange Watermelon", price: 1.00, pic: UIImage(named: "watermelonseedlessorange")!,desc: ""),
        PriceProductPic(name: "Acorn Squash", price: 1.00, pic: UIImage(named: "squashacorn")!,desc: ""),
        PriceProductPic(name: "Butternut Squash", price: 1.00, pic: UIImage(named: "squashbutternut")!,desc: ""),
        PriceProductPic(name: "Speghetti Squash", price: 1.00, pic: UIImage(named: "squashspeghetti")!,desc: "")
    ]
    
    
    // Did Load Logic and registration of TableCell
    override func viewDidLoad() {
        super.viewDidLoad()
        
        productMaster = productMaster.sorted()
        
        // Do any additional setup after loading the view, typically from a nib.
        tableView.register(TableCell.self, forCellReuseIdentifier: cellTableIdentifier)
        let xib = UINib(nibName: "TableCell2", bundle: nil)
        
        tableView.register(xib, forCellReuseIdentifier: cellTableIdentifier)
        tableView.rowHeight = 66
        addNavBarImage()
        
        
    }

 
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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "detail", sender: nil)
        tableView.deselectRow(at: indexPath, animated: true)
        
    }
    
    
    // MARK: - Navigation override
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       // Get the new view controller using [segue destinationViewController].
       // Pass the selected object to the new view controller.
        if segue.identifier == "detail" {
            let detailVC = segue.destination as! ItemViewController
            let row = tableView.indexPathForSelectedRow!.row
            
            
            
            detailVC.productName = productMaster[row].productName
            detailVC.productimage = productMaster[row].productPic
            detailVC.productDescription = productMaster[row].productDescription
            
        }
    }

    
    func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        var arrayTitles:[String] = []
        for item in productMaster{
            let firstLetter = String(item.productName.prefix(1))
            
            if !arrayTitles.contains(firstLetter){
                arrayTitles.append(firstLetter)
            }
        }
        
        return arrayTitles.sorted()
    }
 
    func addNavBarImage() {

        let navController = navigationController!

        let image = UIImage(named: "piscasawnoflower.png")
        let imageView = UIImageView(image: image)

        let bannerWidth = navController.navigationBar.frame.size.width
        let bannerHeight = navController.navigationBar.frame.size.height
        

        let bannerX = bannerWidth / 2 - (image?.size.width)! / 2
        let bannerY = bannerHeight / 2 - (image?.size.height)! / 2

        imageView.frame = CGRect(x: bannerX, y: bannerY, width: bannerWidth, height: bannerHeight)
        imageView.contentMode = .scaleAspectFit

        navigationItem.titleView = imageView
    }
    
    
}
