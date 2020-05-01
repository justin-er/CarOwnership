//
//  OwnershipPresenterDelegate.swift
//  AEFetchedResultsControllerApp
//
//  Created by Amirreza Eghtedari on 21.04.20.
//  Copyright © 2020 Amirreza Eghtedari. All rights reserved.
//

import Foundation

protocol OwnershipPresenterDelegate: class {
    
    func presenterDidReloadData(_ presenter: OwnershipViewModelDataSource)
    
    func presenterDidFilterData(_ presenter: OwnershipViewModelDataSource)
    
    func presenterWillChangeContent(_ presenter: OwnershipViewModelDataSource)
    
    func presenter(_ presenter: OwnershipViewModelDataSource, didChange ownership: OwnershipViewModel?, at indexPath: IndexPath?, for type: AEModelChangeType, newIndexPath: IndexPath?)
    
    func presenterDidChangeSection(_ presenter: OwnershipViewModelDataSource, at sectionIndex: Int, for type: AEModelChangeType)
    
    func presenterDidChangeContent(_ presenter: OwnershipViewModelDataSource)
}
