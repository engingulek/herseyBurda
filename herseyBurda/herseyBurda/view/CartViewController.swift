//
//  CartViewController.swift
//  herseyBurda
//
//  Created by engin gülek on 13.09.2021.
//

import UIKit

class CartViewController: UIViewController {

    @IBOutlet weak var cartProductTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        cartProductTableView.delegate = self
        cartProductTableView.dataSource = self
        

    }
    



}

extension CartViewController:  UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = cartProductTableView.dequeueReusableCell(withIdentifier: "cartProductCell") as! CartProductTableViewCell
       
        return cell
    }
    
    
}
