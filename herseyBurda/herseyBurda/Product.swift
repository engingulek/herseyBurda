//
//  Product.swift
//  herseyBurda
//
//  Created by engin gülek on 12.09.2021.
//

import Foundation
class Product {
    var productId:String
    var productImageName:String
    var productName:String
    var productCount:Int
    var productCategorieName:String
    
    
    
    init(productId:String,productImageName:String,produtName:String,productCount:Int,productCategorieName:String) {
        self.productId = productId
        self.productImageName = productImageName
        self.productName = produtName
        self.productCount = productCount
        self.productCategorieName = productCategorieName
        
    }
}
