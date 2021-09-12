//
//  CategoriesVC.swift
//  herseyBurda
//
//  Created by engin gülek on 11.09.2021.
//

import UIKit

class CategoriesVC: UIViewController {
    @IBOutlet weak var categoriesTableView: UITableView!
    var categories = ["Teknoloji","Giyim","Kitap ve Kırtasiye","Bebek"]
    override func viewDidLoad() {
        super.viewDidLoad()

        categoriesTableView.delegate = self
        categoriesTableView.dataSource = self
        
    }
    


}


extension CategoriesVC:  UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = categories[indexPath.row]
    
        for i in 0...categories.count {
            if i == indexPath.row{
                cell.imageView?.image = UIImage(named: "\(i)")
                
            }
        }
        
       

        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        return "Kategoriler"
        
        
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        let header = view as? UITableViewHeaderFooterView
        header?.textLabel?.textColor = UIColor.red
        header?.textLabel?.font = UIFont.boldSystemFont(ofSize: 25)
        header?.textLabel?.textAlignment = .center
       
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(categories[indexPath.row])
    }
    
}
