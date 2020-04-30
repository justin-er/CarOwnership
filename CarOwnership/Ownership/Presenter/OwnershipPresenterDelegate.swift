//
//  OwnershipPresenterDelegate.swift
//  AEFetchedResultsControllerApp
//
//  Created by Amirreza Eghtedari on 21.04.20.
//  Copyright © 2020 Amirreza Eghtedari. All rights reserved.
//

import Foundation

protocol OwnershipPresenterDelegate: class {
    
    func presenterDidReloadData(_ presenter: OwnershipPresenterInput)
    
    func presenterDidFilterData(_ presenter: OwnershipPresenterInput)
    
    func presenterWillChangeContent(_ presenter: OwnershipPresenterInput)
    
    func presenter(_ presenter: OwnershipPresenterInput, didChange ownership: OwnershipViewModel?, at indexPath: IndexPath?, for type: AEModelChangeType, newIndexPath: IndexPath?)
    
    func presenterDidChangeSection(_ presenter: OwnershipPresenterInput, at sectionIndex: Int, for type: AEModelChangeType)
    
    func presenterDidChangeContent(_ presenter: OwnershipPresenterInput)
}
