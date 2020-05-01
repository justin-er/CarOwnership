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
		presenter?.interactorDidReloadData(self, source: provider)
	}
	
	func providerDidFilterData(_ provider: OwnershipDataProviderInput) {
		presenter?.interactorDidFilterData(self, source: provider)
	}
	
	func providerWillChangeContent(_ provider: OwnershipDataProviderInput) {
		presenter?.interactorWillChangeContent(self, source: provider)
	}
	
	func provider(_ provider: OwnershipDataProviderInput, didChange ownership: Ownership?, at indexPath: IndexPath?, for type: AEModelChangeType, newIndexPath: IndexPath?) {
		presenter?.interactor(self, source: provider, didChange: ownership, at: indexPath, for: type, newIndexPath: newIndexPath)
	}
	
	func providerDidChangeSection(_ provider: OwnershipDataProviderInput, at sectionIndex: Int, for type: AEModelChangeType) {
		presenter?.interactorDidChangeSection(self, source: provider, at: sectionIndex, for: type)
	}
	
	func providerDidChangeContent(_ provider: OwnershipDataProviderInput) {
		presenter?.interactorDidChangeContent(self, source: provider)
	}
}
