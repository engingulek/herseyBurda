//
//  CartViewController.swift
//  herseyBurda
//
//  Created by engin gülek on 13.09.2021.
//

import UIKit
import Firebase

class CartViewController: UIViewController {
    
var cartProductNameArray = [String]()
    var cartProductImageNameArray = [String]()
    var cartProductCountArray = [Int]()
    var toplam = 0
    @IBOutlet weak var totalCountLabel: UILabel!
    @IBOutlet weak var cartProductTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        cartProductTableView.delegate = self
        cartProductTableView.dataSource = self
        
        getDataFromFirestore()
   
  
      
        
        
       
        

    }
    
    func getDataFromFirestore() {
        let firestore = Firestore.firestore()
        
        firestore.collection("cart").addSnapshotListener { (snapshot, error) in
            if error != nil {
                print(error?.localizedDescription ?? "Hata")
            }else {
                if snapshot?.isEmpty != true  && snapshot != nil  {
                    for document in snapshot!.documents {
                        
                        if let cartProductName = document.get("cartProductName") as? String {
                            
                            self.cartProductNameArray.append(cartProductName)
                            
                        }
                        
                        if let cartProductImageName = document.get("cartProductImageName") as? String {
                            self.cartProductImageNameArray.append(cartProductImageName)
                        }
                        
                        if let cartProductCount = document.get("cartProductCount") as? Int {
                            
                            self.toplam += cartProductCount
                            self.cartProductCountArray.append(cartProductCount)
                            print(self.toplam)
                            self.totalCountLabel.text = "Toplam : \(self.toplam)"
                        }
                        
                    }
                    
                    self.cartProductTableView.reloadData()
                    
                  
                    
                }
                
            }
        }
    }
    



}





extension CartViewController:  UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cartProductNameArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = cartProductTableView.dequeueReusableCell(withIdentifier: "cartProductCell") as! CartProductTableViewCell
        cell.cartProductImageView.image = UIImage(named: cartProductImageNameArray[indexPath.row])
        cell.cartProductNameLabel.text = cartProductNameArray[indexPath.row]
        cell.cartProductCountLabel.text = "\(cartProductCountArray[indexPath.row]) TL"
        return cell
    }
    
    
}
