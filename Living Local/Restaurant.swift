//
//  Restaurant.swift
//  Living Local
//
//  Created by Fay Lin  on 8/9/21.
//

import Foundation

class Restaurant{
    var name: String = ""
    var address: String = ""
    var fullDescription: String {return "\(name)\(address)"}
    init(name:String, address: String){
        self.name = name
        self.address = address
    }
}
