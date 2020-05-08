
import Foundation
class Products: Codable {
    var productList: [Product] = []
    var count: Int = 0
    var current = 1
    
  init(fileName : String){
    
    // Get URL
    guard let url = Bundle.main.url(forResource: fileName, withExtension: "json") else {
        return
    }
    
    // Grab Data
    guard let data = try? Data(contentsOf: url) else {
        return
        
    }
    
    // Decode JSON
    guard let jsonData = try? JSONDecoder().decode([Product].self, from: data) else {
        return
        
    }

    // Sort the Data
    productList = jsonData.sorted()
    
    // Get the count
    count = productList.count
    
  }

  // Empty initializer
  init(){}
 
    
  // Get Product by index
  func getProduct(index : Int) -> Product{
    return productList[index]
    
  }
    
}

class Product : Codable, Comparable {
    var name: String
    var smallPictureName: String
    var largePictureName: String
    var descriptionFileName: String
    
    // Comparable Method 1 <
    static func < (lhs: Product, rhs: Product) -> Bool {
 
            return lhs.name < rhs.name

    }
    
    // Comparable Method 2 ==
    static func == (lhs: Product, rhs: Product) -> Bool {
        
        return lhs.name == rhs.name
        
    }
    
}
