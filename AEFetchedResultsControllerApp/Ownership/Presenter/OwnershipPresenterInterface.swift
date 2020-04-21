//
//  OwnershipPresenterInterface.swift
//  AEFetchedResultsControllerApp
//
//  Created by Amirreza Eghtedari on 21.04.20.
//  Copyright © 2020 Amirreza Eghtedari. All rights reserved.
//

import Foundation

protocol OwnershipPresenterInterface: AEListModelProvider  {
    func relaodData()
    func initializeDatabase()
    func deleteObject(at indexPath: IndexPath)
    func addSomething()
    func saveSomething()
}
