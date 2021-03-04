//
//  PhonesDAO.swift
//  baseApp
//
//  Created by mvalbuquerque on 09/03/18.
//  Copyright © 2018 mvalbuquerque. All rights reserved.
//

import UIKit
import CoreData
import Foundation

class PhonesDAO {
    
    private let ENTITY = "Phone"
    private var phone: Phone
    private var context: NSManagedObjectContext
    
    init (context: NSManagedObjectContext) {
        self.context = context
        self.phone = Phone(context: context)
    }
    
    func getContext() -> NSManagedObjectContext {
        return context
    }
    
    func setPhone (phone: Phone) {
        self.phone = phone
    }
    
    func add () -> Bool {
        var saved = true
        if (self.phone.callCenter != nil) {
            do {
                try self.context.save()
            } catch {
                saved = false
            }
        }
        return saved
    }
    
    func list () -> [Phone] {
        var phones: [Phone]
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: self.ENTITY)
        do {
            phones = try context.fetch(request) as! [Phone]
        } catch {
            phones = []
        }
        return phones
    }
    
    func deleteAll () -> Bool {
        var saved = true
        let fetch = NSFetchRequest<NSFetchRequestResult>(entityName: self.ENTITY)
        let batchDelete = NSBatchDeleteRequest(fetchRequest: fetch)
        do {
            try self.context.execute(batchDelete)
        } catch {
            saved = false
        }
        return saved
//        self.context
    }
    
}
