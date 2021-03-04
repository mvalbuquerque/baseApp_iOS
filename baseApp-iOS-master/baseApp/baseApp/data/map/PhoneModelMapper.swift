//
//  PhoneModelMapper.swift
//  baseApp
//
//  Created by mvalbuquerque on 09/03/18.
//  Copyright © 2018 mvalbuquerque. All rights reserved.
//

import Foundation
import CoreData

class PhoneMapper {
    
    static func toPhoneModel (phoneMO: Phone) -> PhoneModel {
        let phoneModel = PhoneModel()
        phoneModel.callCenter = phoneMO.callCenter
        phoneModel.city = phoneMO.city!
        phoneModel.uf = phoneMO.uf!
        phoneModel.phone = phoneMO.phone!
        return phoneModel
    }
    
    static func fromPhoneResponse (phoneResponse: PhoneResponse) -> PhoneModel {
        let phoneModel = PhoneModel()
        phoneModel.callCenter = (phoneResponse.callCenter == 1)
        phoneModel.city = phoneResponse.city
        phoneModel.uf = phoneResponse.uf
        phoneModel.phone = phoneResponse.phone
        return phoneModel
    }
    
    static func
    
}
