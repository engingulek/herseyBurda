//
//  ViewController.swift
//  herseyBurda
//
//  Created by engin gülek on 11.09.2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var searchBar: UISearchBar!

    @IBOutlet weak var productCollectionView: UICollectionView!
    var test = [String]()
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
         test = ["A","B","C","D"]
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



extension ViewController : UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return test.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
      let cell =  productCollectionView.dequeueReusableCell(withReuseIdentifier: "productCell", for: indexPath) as! ProductCollectionViewCell
        
        cell.productNameLabel.text = test[indexPath.row]
        cell.layer.borderColor = UIColor.gray.cgColor
        cell.layer.borderWidth = 1
        cell.layer.cornerRadius = 15
        
        
        return cell
    }
    
    
}


