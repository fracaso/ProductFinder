import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
     
    
     // Cell Identifier
     let cellTableIdentifier = "MonkeyBusiness"
    
    @IBOutlet weak var tableView: UITableView!
   
    // Product Master
    var productMaster: Products = Products()
    
    
    // Did Load Logic and registration of TableCell
    override func viewDidLoad() {
        super.viewDidLoad()
        
        productMaster = Products(fileName: "product")
        
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
        let rowData = productMaster.getProduct(index: indexPath.row)
        
        cell.productItem = rowData.name
        cell.productPrice = 0.00
        cell.productPicture = UIImage(named: "\(rowData.smallPictureName).png")
        
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
            
            detailVC.productName = productMaster.getProduct(index: row).name
            detailVC.productimage = UIImage(named: "\(productMaster.getProduct(index: row).largePictureName).png") ?? UIImage(named: "question.png")!
            
            // Get URL
            guard let url = Bundle.main.url(forResource: productMaster.getProduct(index: row).descriptionFileName, withExtension: "html") else{
                return
            }
            
            // Grab Data
            guard let data = try? Data(contentsOf: url) else {
                return
                
            }
            
            // Convert Data into String for passing
            //let str = String(decoding: data, as: UTF8.self)
            if let attributedString = try? NSAttributedString(data: data, options: [.documentType: NSAttributedString.DocumentType.html], documentAttributes: nil) {
                detailVC.pDesc = attributedString
            }
            //detailVC.productDescription = str
    
            
        }
    }

    
    func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        var arrayTitles:[String] = []
        for item in productMaster.productList{
            let firstLetter = String(item.name.prefix(1))
            
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
