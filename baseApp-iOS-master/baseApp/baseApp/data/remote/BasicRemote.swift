//
//  BasicService.swift
//  baseApp
//
//  Created by mvalbuquerque on 06/03/2018.
//  Copyright © 2018 Fagron Technologies. All rights reserved.
//

import Alamofire
import Foundation

class BasicRemote {
    var headers: HTTPHeaders = [:]
    
    init(useToken: Bool) {
        if (useToken) {
            let userDef = UserDefaults.standard
            self.headers["Authorization"] =  "Bearer " + userDef.string(forKey: "access_token")!
            debugPrint(self.headers)
        }
    }
    
    func getBaseUrl (type: String = "") -> String {
        let baseUrl: String = "https://suaapiaqui.com.br/api/"
        return baseUrl
    }
}
