//
//  OwnershipPresenterInterface.swift
//  AEFetchedResultsControllerApp
//
//  Created by Amirreza Eghtedari on 21.04.20.
//  Copyright © 2020 Amirreza Eghtedari. All rights reserved.
//

import Foundation

protocol OwnershipPresenterInput: class  {
    
    var objects: [OwnershipViewModel]? { get }
    func object(at indexPath: IndexPath) -> OwnershipViewModel
    func objectModelId(at indexPath: IndexPath) -> (ownerModelId: String?, carModelId: String?, manufacturerModelId: String?)
    
    var sctionIndexTitles: [String] { get }
    var numberOfSections: Int? { get }
    func section(forSectionIndexTitle title: String, at sectionIndex: Int) -> Int
    func sectionIndexTitle(forSectionName sectionName: String) -> String?
    func numberOfRowsInSection(at index: Int) -> Int
    func sectionName(at index: Int) -> String?
	
	func providerDidReloadData(_ provider: OwnershipDataProviderInput)
	func providerDidFilterData(_ provider: OwnershipDataProviderInput)
	func providerWillChangeContent(_ provider: OwnershipDataProviderInput)
	func provider(_ provider: OwnershipDataProviderInput, didChange ownership: Ownership?, at indexPath: IndexPath?, for type: AEModelChangeType, newIndexPath: IndexPath?)
	func providerDidChangeSection(_ provider: OwnershipDataProviderInput, at sectionIndex: Int, for type: AEModelChangeType)
	func providerDidChangeContent(_ provider: OwnershipDataProviderInput)
}
