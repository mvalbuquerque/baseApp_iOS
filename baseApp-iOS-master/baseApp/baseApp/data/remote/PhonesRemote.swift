//
//  PhonesRemote.swift
//  baseApp
//
//  Created by Fagron Technologies on 06/03/18.
//  Copyright © 2018 Fagron Technologies. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireObjectMapper
import RxSwift

class PhonesRemote: BasicRemote {
    
    init() {
        super.init(useToken: false)
    }
    
    func list () -> Observable<[PhoneResponse]> {
        let url = getBaseUrl() + "telefones"
        return Observable.create { observer in
            Alamofire.request(url, method: .get).responseArray {
                (response: DataResponse<[PhoneResponse]>) in
                if (response.result.isSuccess) {
                    let phones: [PhoneResponse] = response.result.value!
                    observer.on(.next(phones))
                } else {
                    observer.on(.next([]))
                }
                observer.on(.completed)
            }
            return Disposables.create()
        }
    }
    
}
