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
    
    static func toPhoneModel (phoneResponse: PhoneResponse) -> PhoneModel {
        let phoneModel = PhoneModel()
        phoneModel.callCenter = (phoneResponse.callCenter == 1)
        phoneModel.city = phoneResponse.city
        phoneModel.uf = phoneResponse.uf
        phoneModel.phone = phoneResponse.phone
        return phoneModel
    }
    
    static func toPhone (phoneModel: PhoneModel, context: NSManagedObjectContext) -> Phone {
        let phone = Phone(context: context)
        phone.callCenter = phoneModel.callCenter
        phone.uf = phoneModel.uf
        phone.city = phoneModel.city
        phone.phone = phoneModel.phone
        return phone
    }
    
}
