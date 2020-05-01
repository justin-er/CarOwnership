//
//  OwnershipPresenterInterface.swift
//  AEFetchedResultsControllerApp
//
//  Created by Amirreza Eghtedari on 21.04.20.
//  Copyright © 2020 Amirreza Eghtedari. All rights reserved.
//

import Foundation

protocol OwnershipPresenterInput: class  {

	func interactorDidReloadData(_ interactor: OwnershipInteractorInput, source: OwnershipDataSource)
	func interactorDidFilterData(_ interactor: OwnershipInteractorInput, source: OwnershipDataSource)
	func interactorWillChangeContent(_ interactor: OwnershipInteractorInput, source: OwnershipDataSource)
	func interactor(_ interactor: OwnershipInteractorInput, source: OwnershipDataSource, didChange ownership: Ownership?, at indexPath: IndexPath?, for type: AEModelChangeType, newIndexPath: IndexPath?)
	func interactorDidChangeSection(_ interactor: OwnershipInteractorInput, source: OwnershipDataSource, at sectionIndex: Int, for type: AEModelChangeType)
	func interactorDidChangeContent(_ interactor: OwnershipInteractorInput, source: OwnershipDataSource)
}
