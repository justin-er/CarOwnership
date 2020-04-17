//
//  ManagedManufacturer+CoreDataClass.swift
//  AEFetchedResultsControllerApp
//
//  Created by Amirreza Eghtedari on 16.04.20.
//  Copyright © 2020 Amirreza Eghtedari. All rights reserved.
//
//

import Foundation
import CoreData

@objc(ManagedManufacturer)
public class ManagedManufacturer: NSManagedObject {

    convenience init(contex: NSManagedObjectContext, name: String, ranking: Int16) {
        self.init(context: contex)
        
        self.name = name
        self.ranking = ranking
    }
}
