//
//  PhoneSuportModel.swift
//  baseApp
//
//  Created by Fagron Technologies on 06/03/18.
//  Copyright © 2018 Fagron Technologies. All rights reserved.
//

import Foundation
import ObjectMapper

class PhoneResponse: Mappable {
    required init?(map: Map) {
        
    }
    
    var callCenter: Int = 0
    var uf: String = ""
    var city: String = ""
    var phone: String = ""
    
    func mapping(map: Map) {
        self.callCenter <- map["principal"]
        self.uf <- map["estado"]
        self.city <- map["cidade"]
        self.phone <- map["telefone"]
    }
}

