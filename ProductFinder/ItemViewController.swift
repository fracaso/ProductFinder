//
//  ItemViewController.swift
//  ProductFinder
//
//  Created by Aaron Kinney on 4/11/20.
//  Copyright © 2020 HarvardInc. All rights reserved.
//

import UIKit

class ItemViewController: UIViewController {
    
    var productimage: UIImage = UIImage()
    var productName: String = ""
    var productQuantityType: String = ""
    var productDescription: String = ""
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var labelProductDescription: UILabel!
    @IBOutlet weak var labelQuantityType: UILabel!
    @IBOutlet weak var imageViewItem: UIImageView!
    @IBOutlet weak var labelProductName: UILabel!
    @IBOutlet weak var textboxQuantity: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // This is the assignment of value to the labels and pictures and such that can only
        // be done effectively here after the prepare step (the calling step) from ViewController
        // has placed values in the object data.
        //labelQuantityType.text = productQuantityType
        labelProductName.text = productName
        imageViewItem.image = productimage
        
        // Standard Function that formats all descriptions
        truncatedDescriptionLabelText()
        
        
        // Add label Tap
        self.setupLabelTap()
    }
    
    // bringing action to label
    @objc func labelTapped(_ sender: UITapGestureRecognizer) {
        
        // If the number of lines is 1, we know the label is in a truncated state
        if labelProductDescription.numberOfLines == 1{
           
            // From Extension of View. This automates the change of number of lines
           self.labelProductDescription.fadeTransition(0.4)
           self.labelProductDescription.text = productDescription
            
           // Setting the lines to 0 causes the label to size itself appropriately based on
           // whats there
           self.labelProductDescription.numberOfLines = 0
            
        } else{
            
           // Back to truncated label
           self.labelProductDescription.fadeTransition(0.4)
           truncatedDescriptionLabelText()
           self.labelProductDescription.numberOfLines = 1
        }
    }
    
    // Adding Label Tap to make descriptions collapsable
    func setupLabelTap() {
        
        let labelTap = UITapGestureRecognizer(target: self, action: #selector(self.labelTapped(_:)))
        self.labelProductDescription.isUserInteractionEnabled = true
        self.labelProductDescription.addGestureRecognizer(labelTap)
        
    }
    
    // This function will auto generate how the description will work for each and every description.
    func truncatedDescriptionLabelText(){
        let attrs1 = [NSAttributedString.Key.foregroundColor : UIColor.black]

        let attrs2 = [NSAttributedString.Key.foregroundColor : UIColor.blue]

        let attributedString1 = NSMutableAttributedString(string : String(productDescription.prefix(25)), attributes:attrs1)

        let attributedString2 = NSMutableAttributedString(string:" ...", attributes:attrs2)

        attributedString1.append(attributedString2)
        self.labelProductDescription.fadeTransition(0.4)
        self.labelProductDescription.attributedText = attributedString1

    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let destinationVC = segue.destination as? ItemViewController{
            destinationVC.textboxQuantity.text = segue.identifier
        }
    }
}
