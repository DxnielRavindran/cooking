//
//  Recipe.swift
//  cooker
//
//  Created by MAD2_P03 on 9/12/19.
//  Copyright © 2019 MAD2_P03. All rights reserved.
//

import Foundation


class Recipe {
    
    var name:String?
    var preperationTime: Int16?
    
    
    init (name: String, preperationTime:Int16)
    {
    
        self.name = name
        self.preperationTime = preperationTime
        
    }
}
