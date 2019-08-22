//
//  PhonesRepository.swift
//  baseApp
//
//  Created by Fagron Technologies on 06/03/18.
//  Copyright © 2018 Fagron Technologies. All rights reserved.
//

import Foundation
import RxSwift

class PhonesRepository {
    
    private var phonesRemote: PhonesRemote
    private var phonesDAO: PhonesDAO
    
    init(phonesRemote: PhonesRemote, phonesDAO: PhonesDAO) {
        self.phonesRemote = phonesRemote
        self.phonesDAO = phonesDAO
    }
    //ToDo: Colocar um atualiza cache
    func getList () -> Observable<[PhoneModel]> {
        return Observable.create { observer in
            //Pega do local
            self.getListLocal()
                .subscribe(onNext: { phonesLocal in
                    if (phonesLocal.count > 0) {
                        observer.on(.next(phonesLocal))
                    } else {
                        //Pega do remote
                        self.getListRemote()
                            .subscribe(onNext: { phones in
                                if (phonesLocal.count > 0) {
                                    self.deleteAll()
                                }
                                self.addAll(phones: phones)
                                observer.on(.next(phones))
                            })
                    }
                })
        }
    }
    
    func add (phoneModel: PhoneModel) {
        let phone = PhoneMapper.toPhone(phoneModel: phoneModel, context: self.phonesDAO.getContext())
        self.phonesDAO.setPhone(phone: phone)
        self.phonesDAO.add()
    }
    
    func addAll (phones: [PhoneModel]) {
        for phone in phones {
            self.add(phoneModel: phone)
        }
    }
    
    func deleteAll () {
        self.phonesDAO.deleteAll()
    }
    
    private func getListRemote () -> Observable<[PhoneModel]> {
        return Observable.create { observer in
            self.phonesRemote.list()
                .subscribe(onNext: { phonesResponse in
                    var phones: [PhoneModel] = []
                    if (phonesResponse.count > 0) {
                        for phone in phonesResponse {
                            let phoneModel = PhoneMapper.toPhoneModel(phoneResponse: phone)
                            phones.append(phoneModel)
                        }
                    }
                    observer.onNext(phones)
                    observer.onCompleted()
                })
        }
    }
    
    private func getListLocal () -> Observable<[PhoneModel]> {
        return Observable.create { observer in
            var phones: [PhoneModel] = []
            let phonesMO = self.phonesDAO.list()
            if (phones.count > 0) {
                for phone in phonesMO {
                    let phoneModel = PhoneMapper.toPhoneModel(phoneMO: phone)
                    phones.append(phoneModel)
                }
            }
            observer.onNext(phones)
            observer.onCompleted()
            return Disposables.create()
        }
    }
    
}
