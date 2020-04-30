//
//  OwnershipUseCase.swift
//  AEFetchedResultsControllerApp
//
//  Created by Amirreza Eghtedari on 30.04.20.
//  Copyright © 2020 Amirreza Eghtedari. All rights reserved.
//

import Foundation

class OwnershipInteractor: OwnershipInteractorInput {
	
	var presenter:		OwnershipPresenterInput?
	var dataProvider:	OwnershipDataProviderInput?
	
	func reloadData() {
        dataProvider?.relaodData()
    }
	
	func deleteObject(object: Ownership) {
		dataProvider?.deleteObject(object: object)
	}
	
	func deleteObject(at indexPath: IndexPath) {
		dataProvider?.deleteObject(at: indexPath)
	}

	func updateObject(at indexPath: IndexPath, by data: Ownership) {
		dataProvider?.updateObject(at: indexPath, by: data)
	}
	
	func insertObject(by data: Ownership) {
		dataProvider?.insertObject(by: data)
	}
}

extension OwnershipInteractor: OwnershipDataProviderDelegate {
	
	func providerDidReloadData(_ provider: OwnershipDataProviderInput) {
		presenter?.providerDidReloadData(provider)
	}
	
	func providerDidFilterData(_ provider: OwnershipDataProviderInput) {
		presenter?.providerDidFilterData(provider)
	}
	
	func providerWillChangeContent(_ provider: OwnershipDataProviderInput) {
		presenter?.providerWillChangeContent(provider)
	}
	
	func provider(_ provider: OwnershipDataProviderInput, didChange ownership: Ownership?, at indexPath: IndexPath?, for type: AEModelChangeType, newIndexPath: IndexPath?) {
		
		presenter?.provider(provider, didChange: ownership, at: indexPath, for: type, newIndexPath: newIndexPath)
	}
	
	func providerDidChangeSection(_ provider: OwnershipDataProviderInput, at sectionIndex: Int, for type: AEModelChangeType) {
		
		presenter?.providerDidChangeSection(provider, at: sectionIndex, for: type)
	}
	
	func providerDidChangeContent(_ provider: OwnershipDataProviderInput) {
		presenter?.providerDidChangeContent(provider)
	}
}
