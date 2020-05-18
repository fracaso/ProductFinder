import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
     
     // Cell Identifier
    let cellTableIdentifier = "MonkeyBusiness"

    // Product Master
    var productMaster: Products = Products()
    
    // Keys and Names for the Build
    var names: [String: [String]]!
    var keys: [String]!
    
    @IBOutlet weak var tableView: UITableView!
   
//************************************************************************************************
// VIEW DID LOAD
//************************************************************************************************
    override func viewDidLoad() {
        super.viewDidLoad()
        
        productMaster = Products(fileName: "product")
        
        // Do any additional setup after loading the view, typically from a nib.
        tableView.register(TableCell.self, forCellReuseIdentifier: cellTableIdentifier)
        let xib = UINib(nibName: "TableCell2", bundle: nil)
        
        tableView.register(xib, forCellReuseIdentifier: cellTableIdentifier)
        tableView.rowHeight = 66
        addNavBarImage()
        
        // These are the Keys in the Section to the right on the Table View
        keys = productMaster.getSectionHeaders()
        names = productMaster.productDict
        
    }

//************************************************************************************************
// MARK: Table View Data Source Methods
//************************************************************************************************
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         
        let key = keys[section]
        let nameSection = names[key]!
        
        return nameSection.count
        
    }
    
//************************************************************************************************
// Set The Cell and Data
//************************************************************************************************
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell( withIdentifier: cellTableIdentifier, for: indexPath) as! TableCell
        
        let name = String(names[keys[indexPath[0]]]![indexPath[1]])
        
        let rowData = productMaster.getProductByName(name: name)
        
        print(names[keys[indexPath[0]]]![indexPath[1]])
        
        cell.productItem = rowData.name
        cell.productPrice = 0.00
        cell.productPicture = UIImage(named: "\(rowData.smallPictureName).png")
        
        return cell
        
    }
    
//************************************************************************************************
// Move On Segue
//************************************************************************************************
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        self.performSegue(withIdentifier: "detail", sender: nil)
        
        tableView.deselectRow(at: indexPath, animated: true)
        
    }
    
//************************************************************************************************
// Chooses which Index Value to set closest to the top
//************************************************************************************************
    func tableView(_ tableView: UITableView, sectionForSectionIndexTitle title: String, at index: Int) -> Int {
        
        return index
    
    }

//************************************************************************************************
// Return the Groups Key
//************************************************************************************************
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        return keys[section]
    
    }
    
//************************************************************************************************
// Get Count of Sections
//************************************************************************************************
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return keys.count
        
    }

//************************************************************************************************
// Get the Section Indexes
//************************************************************************************************
    func sectionIndexTitles(for tableView: UITableView) -> [String]? {
            
            return keys
    }
        
//************************************************************************************************
// MARK: - Navigation override
//************************************************************************************************
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       // Get the new view controller using [segue destinationViewController].
       // Pass the selected object to the new view controller.
        if segue.identifier == "detail" {
            let detailVC = segue.destination as! ItemViewController
            let row = tableView.indexPathForSelectedRow!.row
            
            detailVC.productName = productMaster.getProductByIndex(index: row).name
            detailVC.productimage = UIImage(named: "\(productMaster.getProductByIndex(index: row).largePictureName).png") ?? UIImage(named: "question.png")!
            
            // Get URL
            guard let url = Bundle.main.url(forResource: productMaster.getProductByIndex(index: row).descriptionFileName, withExtension: "html") else{
                return
            }
            
            // Grab Data
            guard let data = try? Data(contentsOf: url) else {
                return
                
            }
            
            // Convert Data into String for passing
            if let attributedString = try? NSAttributedString(data: data, options: [.documentType: NSAttributedString.DocumentType.html], documentAttributes: nil) {
                detailVC.pDesc = attributedString
            }
            
        }
    }
     
//************************************************************************************************
// Add the Navigation Bar with Png and Cart
//************************************************************************************************
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
