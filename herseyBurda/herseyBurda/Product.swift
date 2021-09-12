//
//  Product.swift
//  herseyBurda
//
//  Created by engin gülek on 12.09.2021.
//

import Foundation
class Product {
    var productImageName:String
    var productName:String
    var productCount:Int
    var productCategorieName:String
    
    
    init(productImageName:String,produtName:String,productCount:Int,productCategorieName:String) {
        self.productImageName = productImageName
        self.productName = produtName
        self.productCount = productCount
        self.productCategorieName = productCategorieName
        
    }
}
