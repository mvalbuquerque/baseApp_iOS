//
//  PhonesVMFactory.swift
//  baseApp
//
//  Created by mvalbuquerque on 06/03/18.
//  Copyright © 2018 mvalbuquerque. All rights reserved.
//

import Foundation

struct PhonesVMFactory {
    static func create (appDelegate: AppDelegate) -> PhonesViewModel {
        let context = appDelegate.persistentContainer.viewContext
        let phonesRepository = PhonesRepository(phonesRemote: PhonesRemote(), phonesDAO: PhonesDAO(context: context))
        return PhonesViewModel(phonesRepository: phonesRepository)
    }
}
