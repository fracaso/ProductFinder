
import Foundation
class Products: Codable {
    var productList: [Product] = []
    var count: Int = 0
    var current = 1
    var productDict : [String: [String]] = [:]
    
//************************************************************************************************
// INIT WITH FILE NAME
//************************************************************************************************
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
        getDictionaryByFirstLetter()
    }

//************************************************************************************************
// INIT EMPTY
//************************************************************************************************
    init(){}
 
//************************************************************************************************
// Get Product by Name
//************************************************************************************************
    func getProductByName(name : String) -> Product{
        
        var returnProduct : Product = Product()
        
        for product in productList{
            if product.name == name {
                returnProduct = product
            }
        }
        
        return returnProduct
    }
    
//************************************************************************************************
// Get Product by index
//************************************************************************************************
    func getProductByIndex(index : Int) -> Product{
        
        return productList[index]
        
    }
    
//************************************************************************************************
// Returns an Array of Prduct Names
//************************************************************************************************
    func getProducts() ->[String] {
        var productNameArray: [String] = []

        for p in productList{
            productNameArray.append(p.name)
        }

        return productNameArray.sorted()
    }
   
//************************************************************************************************
// Returns an Array of Section Headers
//************************************************************************************************
    func getSectionHeaders() -> [String]{
        var arrayTitles : [String] = []
        
        for key in productDict.keys{
            arrayTitles.append(key)
        }
 
    return arrayTitles.sorted()
  }
    
//************************************************************************************************
// Creates Private Data Dictionary
//************************************************************************************************
    func getDictionaryByFirstLetter(){
        
        for item in productList{
            let name = item.name
            let letter = String(name.prefix(1))
            if productDict[letter] != nil {
                var r = productDict[letter]!
                r.append(name)
                productDict[letter] = r
            } else{
                productDict[letter] = [name]
            }
        }
    }

    
}

class Product : Codable, Comparable {
    var name: String = ""
    var smallPictureName: String = ""
    var largePictureName: String = ""
    var descriptionFileName: String = ""
    
//************************************************************************************************
// INIT EMPTY
//************************************************************************************************
    init(){}
    
//************************************************************************************************
// Comparable Method 1 <
//************************************************************************************************
    static func < (lhs: Product, rhs: Product) -> Bool {
 
            return lhs.name < rhs.name

    }

//************************************************************************************************
// Comparable Method 2 ==
//************************************************************************************************
   
    static func == (lhs: Product, rhs: Product) -> Bool {
        
        return lhs.name == rhs.name
        
    }
    
}
