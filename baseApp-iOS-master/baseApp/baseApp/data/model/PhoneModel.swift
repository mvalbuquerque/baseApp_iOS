//
//  PhonesModel.swift
//  baseApp
//
//  Created by Fagron Technologies on 06/03/18.
//  Copyright © 2018 Fagron Technologies. All rights reserved.
//

import Foundation

class PhoneModel {
    var callCenter: Bool = false
    var uf: String = ""
    var city: String = ""
    var phone: String = ""
    
    func toString () -> String {
        if (callCenter) {
            return self.phone
        }
        
        var text = ""
        
        if (self.uf != "") {
            text += self.uf
        }
        
        if (self.city != "") {
            if (text != "") {
                text += " - "
            }
            text += self.city
        }
        
        if (self.phone != "") {
            if (text != "") {
                text += " - "
            }
            text += self.phone
        }
        
        return text
    }
}
