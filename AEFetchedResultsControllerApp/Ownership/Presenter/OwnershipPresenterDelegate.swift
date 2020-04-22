//
//  OwnershipPresenterDelegate.swift
//  AEFetchedResultsControllerApp
//
//  Created by Amirreza Eghtedari on 21.04.20.
//  Copyright © 2020 Amirreza Eghtedari. All rights reserved.
//

import Foundation

protocol OwnershipPresenterDelegate: class {
    
    func presenterDidReloadData(_ presenter: OwnershipPresenterInterface)
    
    func presenterDidFilterData(_ presenter: OwnershipPresenterInterface)
    
//    func presenter(_ presenter: OwnershipPresenterInterface, didChangeModels changeEvent: AEModelEvent<OwnershipViewModel>)
//    
//    func presenter(_ presenter: OwnershipPresenterInterface, didChangeSections changeEvent: AESectionInfoEvent)
    
    func presenterWillChangeContent(_ presenter: OwnershipPresenterInterface)
    
    func presenter(_ presenter: OwnershipPresenterInterface, didChange ownership: OwnershipViewModel?, at indexPath: IndexPath?, for type: AEModelChangeType, newIndexPath: IndexPath?)
    
    func presenterDidChangeSection(_ presenter: OwnershipPresenterInterface, at sectionIndex: Int, for type: AEModelChangeType)
    
    func presenterDidChangeContent(_ presenter: OwnershipPresenterInterface)
}
