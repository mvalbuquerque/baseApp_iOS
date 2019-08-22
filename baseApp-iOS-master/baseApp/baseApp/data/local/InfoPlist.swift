//
//  InfoPlist.swift
//  baseApp
//
//  Created by Fagron Technologies on 25/04/18.
//  Copyright © 2018 Fagron Technologies. All rights reserved.
//

import Foundation

class InfoPlist  {
    private var infos: Dictionary<String, AnyObject>
    init () {
        if let infosPlist = Bundle.main.infoDictionary {
            self.infos = infosPlist as Dictionary<String, AnyObject>
        } else {
            self.infos = [:]
        }
    }
    
    func getValue (key: String) -> AnyObject {
        return infos[key]!
    }
}
