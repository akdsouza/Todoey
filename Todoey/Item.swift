//
//  Item.swift
//  Todoey
//
//  Created by Anup DSouza on 12/01/18.
//  Copyright © 2018 Anup DSouza. All rights reserved.
//

import Foundation

class Item: Codable { // both encodable & decodable
    
    var title: String = ""
    var done: Bool = false
}
