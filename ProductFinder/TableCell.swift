import UIKit

class TableCell: UITableViewCell {
    
    @IBOutlet weak var productLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var productImage: UIImageView!
 
    // Set Product Item Name
     var productItem: String = "" {
         didSet {
             if (productItem != oldValue) {
                 productLabel.text = productItem

             }

         }

     }
    
    // Set
    var productPrice: Double = 0.0 {
        didSet {
            if (productPrice - oldValue > 0) {
                priceLabel.text = String(format: "$%.02f", productPrice)

            }

        }

    }
 
    var productPicture: UIImage? = UIImage(named: "question")! {
         didSet {
             if productPicture != oldValue  {
                productImage.image = productPicture

             }

         }

     }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Initialization code
    }

//    override func setSelected(_ selected: Bool, animated: Bool) {
//        super.setSelected(selected, animated: animated)
//
//        // Configure the view for the selected state
//        if productItem  != "" {
//            print("Selected")
//        }
//    }
    
    
    

}
