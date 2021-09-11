//
//  CategoriesVC.swift
//  herseyBurda
//
//  Created by engin gülek on 11.09.2021.
//

import UIKit

class CategoriesVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = categories[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        return "Kategoriler"
        
        
    }
    

    @IBOutlet weak var categoriesTableView: UITableView!
    var categories = ["Teknoloji","Giyim","Kitap ve Kırtasiye","Bebek"]
    override func viewDidLoad() {
        super.viewDidLoad()

        categoriesTableView.delegate = self
        categoriesTableView.dataSource = self
        
    }
    


}
