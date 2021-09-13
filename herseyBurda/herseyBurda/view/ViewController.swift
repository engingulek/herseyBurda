//
//  ViewController.swift
//  herseyBurda
//
//  Created by engin gülek on 11.09.2021.
//

import UIKit
import Firebase

class ViewController: UIViewController {

    @IBOutlet weak var searchBar: UISearchBar!

    @IBOutlet weak var productCollectionView: UICollectionView!
    var products = [Product]()

 
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
         
        let product1 = Product(productId: "babayHammock\(UUID().uuidString)", productImageName: "babySal", produtName: "Bebek Hamak", productCount: 300, productCategorieName: "Bebek")
        
        let product2 = Product(productId: "book\(UUID().uuidString)", productImageName: "book", produtName: "Kitap", productCount: 20, productCategorieName: "Kitap ve Kırtasiye")
        
        let product3 = Product(productId: "tshirt\(UUID().uuidString)", productImageName: "tshirt", produtName: "Tişört", productCount: 50, productCategorieName: "Giyim")
        
        products.append(product1)
        products.append(product2)
        products.append(product3)
        
        
        productCollectionView.delegate = self
        productCollectionView.dataSource = self
        let design : UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        
        let width = self.productCollectionView.frame.size.width
        
        design.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        design.itemSize = CGSize(width: (width-30)/2, height: (690-30)/2)
        design.minimumLineSpacing = 30
        
        productCollectionView!.collectionViewLayout = design
        
    }

}



extension ViewController : UICollectionViewDelegate, UICollectionViewDataSource,CollectionViewCellProtocol{
    func productAddtoCartProtocol(indexPath: IndexPath) {
        
        
        
        
        let cartProduct = products[indexPath.row]
       
        
        let firestoreDatabase =  Firestore.firestore();
        
        // oluşturdın ama kullanmadın hatası geçerli değil çalışmakta
        var firestoreReferance : DocumentReference? = nil
       // [String : Any] Dictionary oolduğunu belirtiyoruz
        let firestoreCart = ["cartProduct":cartProduct.productId,"cartProductImageName":cartProduct.productImageName,"cartProductName":cartProduct.productName,"cartProductCount":cartProduct.productCount,"piece":1] as [String : Any]
        
        
        
       firestoreReferance = firestoreDatabase.collection("Cart").addDocument(data: firestoreCart, completion: { (error) in
            
            if error != nil {
                self.alerMessage(title: "Hata", message: error?.localizedDescription ?? "Herhangi bir hata oluştu")
                
            }
        })
            
    }
    
  
    
    
    func alerMessage (title:String,message:String){
        let alertAction = UIAlertAction(title: title, style: UIAlertAction.Style.default, handler: nil)
        let alertController = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        alertController.addAction(alertAction)
        self.present(alertController, animated: true, completion: nil)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return products.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
      let cell =  productCollectionView.dequeueReusableCell(withReuseIdentifier: "productCell", for: indexPath) as! ProductCollectionViewCell
        let getProduct = products[indexPath.row]
        cell.productNameLabel.text = getProduct.productName
        cell.productCountLabel.text = "\(getProduct.productCount) TL"
        cell.productImageView.image = UIImage(named: getProduct.productImageName)
        cell.layer.borderColor = UIColor.gray.cgColor
        cell.layer.borderWidth = 1
        cell.layer.cornerRadius = 15
        cell.productAddtoCartProtocol = self;
        cell.indexPath = indexPath
        
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
      let storybord = UIStoryboard(name: "Main", bundle: nil)
        let gotoWillViewController = storybord.instantiateViewController(identifier: "toDetailsProdutc") as! ProductDetailsViewController
        let gotoWillProduct = products[indexPath.row]
        gotoWillViewController.detailProductImageName = gotoWillProduct.productImageName
        gotoWillViewController.detailProductName = gotoWillProduct.productName
        gotoWillViewController.detailProductCount = gotoWillProduct.productCount
        self.present(gotoWillViewController, animated: true, completion: nil)
    }
    
    
}


