//
//  ProductDetailsViewController.swift
//  herseyBurda
//
//  Created by engin gülek on 12.09.2021.
//

import UIKit

class ProductDetailsViewController: UIViewController {
    @IBOutlet weak var detailProductImageView: UIImageView!
    
    @IBOutlet weak var detailProductCountLabel: UILabel!
    @IBOutlet weak var detailProductNameLabel: UILabel!
    var detailProductImageName:String?
    var detailProductName:String?
    var detailProductCount:Int?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        detailProductImageView.image = UIImage(named: detailProductImageName! )
        detailProductNameLabel.text = detailProductName!
        detailProductCountLabel.text = "\(detailProductCount!) TL"
        
        
        

        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
