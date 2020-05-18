import UIKit

class ItemViewController: UIViewController {
    
    var productimage: UIImage = UIImage()
    var productName: String = ""
    var productQuantityType: String = ""
    var productDescription: String = ""
    var pDesc: NSAttributedString = NSAttributedString()
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var labelQuantityType: UILabel!
    @IBOutlet weak var imageViewItem: UIImageView!
    @IBOutlet weak var labelProductName: UILabel!
    @IBOutlet weak var textboxQuantity: UITextField!
    
    @IBOutlet weak var testView: UITextView!
    
//************************************************************************************************
// VIEW DID LOAD
//************************************************************************************************
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // This is the assignment of value to the labels and pictures and such that can only
        // be done effectively here after the prepare step (the calling step) from ViewController
        // has placed values in the object data.
        labelProductName.text = productName
        imageViewItem.image = productimage
        
        // Standard Function that formats all descriptions
        let attrs = [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 20)]
        
        let pDesc2 = NSMutableAttributedString(attributedString: pDesc)
        
        pDesc2.addAttributes(attrs, range: NSRange(location: 0, length: pDesc.length))
        self.testView.attributedText = pDesc2

    }
    
 //************************************************************************************************
// MARK: - Navigation
 //************************************************************************************************
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let destinationVC = segue.destination as? ItemViewController{
            destinationVC.textboxQuantity.text = segue.identifier
        }
    }
}
