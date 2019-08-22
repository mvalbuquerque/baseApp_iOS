//
//  MainViewModel.swift
//  baseApp
//
//  Created by Fagron Technologies on 25/04/18.
//  Copyright © 2018 Fagron Technologies. All rights reserved.
//

import Foundation

class MainViewModel {
    
    private var infoPlist: InfoPlist
    
    init (infoPlist: InfoPlist) {
        self.infoPlist = infoPlist
    }
    
    func getTenant () -> String {
        let tenant = self.infoPlist.getValue(key: "TenantId")
                print(tenant as! String)
        return tenant as! String
    }
}
