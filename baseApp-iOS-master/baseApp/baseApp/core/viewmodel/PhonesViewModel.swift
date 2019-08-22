//
//  PhonesViewModel.swift
//  baseApp
//
//  Created by Fagron Technologies on 06/03/18.
//  Copyright © 2018 Fagron Technologies. All rights reserved.
//

import Foundation
import RxSwift

class PhonesViewModel {
    private var phonesRepository: PhonesRepository
    
    init (phonesRepository: PhonesRepository) {
        self.phonesRepository = phonesRepository
    }
    
    func getList() -> Observable<[[PhoneModel]]> {
        return Observable.create { observer in
            self.phonesRepository.getList()
                .subscribe(onNext: { phones in
                    var phonesDisplay: [[PhoneModel]] = []
                    
                    var phonesCallCenter: [PhoneModel] = []
                    var phonesRegions: [PhoneModel] = []
                    
                    for phone in phones {
                        if (phone.callCenter) {
                            phonesCallCenter.append(phone)
                        } else {
                            phonesRegions.append(phone)
                        }
                    }
                    
                    phonesDisplay.append(phonesCallCenter)
                    phonesDisplay.append(phonesRegions)
                    observer.on(.next(phonesDisplay))
                    observer.on(.completed)
                })
        }
    }
}
