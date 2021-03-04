//
//  MainVMFactory.swift
//  baseApp
//
//  Created by mvalbuquerque on 25/04/18.
//  Copyright © 2018 Fagron Technologies. All rights reserved.
//

import Foundation

struct MainVMFactory {
    static func create () -> MainViewModel {
        return MainViewModel(infoPlist: InfoPlist())
    }
}
