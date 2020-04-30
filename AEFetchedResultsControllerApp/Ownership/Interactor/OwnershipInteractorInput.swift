//
//  OwnershipUseCaseInput.swift
//  AEFetchedResultsControllerApp
//
//  Created by Amirreza Eghtedari on 30.04.20.
//  Copyright © 2020 Amirreza Eghtedari. All rights reserved.
//

import Foundation

protocol OwnershipInteractorInput {
	
	func reloadData()
    
	func deleteObject(object: Ownership)
	func deleteObject(at indexPath: IndexPath)
    func updateObject(at indexPath: IndexPath, by data: Ownership)
    func insertObject(by data: Ownership)
}
