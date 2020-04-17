//
//  DBProviderInterface02.swift
//  AEFetchedResultsControllerApp
//
//  Created by Amirreza Eghtedari on 17.04.20.
//  Copyright © 2020 Amirreza Eghtedari. All rights reserved.
//

import Foundation

protocol DBProvider02Interface {
    
    func relaodData()
    func initializeDatabase()
    func addSomething()
    func saveSomething()
    func deleteObject(at indexPath: IndexPath)
}
