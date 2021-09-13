//
//  CartProductTableViewCell.swift
//  herseyBurda
//
//  Created by engin gülek on 13.09.2021.
//

import UIKit

class CartProductTableViewCell: UITableViewCell {

    @IBOutlet weak var cartProductImageView: UIImageView!
    
    @IBOutlet weak var cartProductCountLabel: UILabel!
    @IBOutlet weak var cartProductNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
