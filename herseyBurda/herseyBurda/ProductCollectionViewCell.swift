//
//  ProductCollectionViewCell.swift
//  herseyBurda
//
//  Created by engin gülek on 12.09.2021.
//

import UIKit


protocol CollectionViewCellProtocol {
    func  productAddtoCartProtocol(indexPath:IndexPath)
}


class ProductCollectionViewCell: UICollectionViewCell {
    
    var productAddtoCartProtocol:CollectionViewCellProtocol?
    var indexPath:IndexPath?
    
    @IBOutlet weak var testLabel: UILabel!
    @IBOutlet weak var productImageView: UIImageView!
    
    @IBOutlet weak var productNameLabel: UILabel!
    @IBOutlet weak var productCountLabel: UILabel!
  
    @IBAction func productAddtoCart(_ sender: Any) {
        productAddtoCartProtocol?.productAddtoCartProtocol(indexPath: indexPath!)
    }
}
