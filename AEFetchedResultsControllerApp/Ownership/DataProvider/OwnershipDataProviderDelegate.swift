//
//  DBProviderDelegate.swift
//  AEFetchedResultsControllerApp
//
//  Created by Amirreza Eghtedari on 16.04.20.
//  Copyright © 2020 Amirreza Eghtedari. All rights reserved.
//

import Foundation

protocol OwnershipDataProviderDelegate: class {
    
    func providerDidReloadData(_ provider: OwnershipDataProviderInterface)
    
    func providerDidFilterData(_ provider: OwnershipDataProviderInterface)
    
//    func provider(_ provider: OwnershipDataProviderInterface, didChangeModels changeEvent: AEModelEvent<Ownership>)
//    
//    func provider(_ provider: OwnershipDataProviderInterface, didChangeSections changeEvent: AESectionInfoEvent)
    
    func providerWillChangeContent(_ provider: OwnershipDataProviderInterface)
    
    func provider(_ provider: OwnershipDataProviderInterface, didChange ownership: Ownership?, at indexPath: IndexPath?, for type: AEModelChangeType, newIndexPath: IndexPath?)
    
    func providerDidChangeSection(_ provider: OwnershipDataProviderInterface, at sectionIndex: Int, for type: AEModelChangeType)
    
    func providerDidChangeContent(_ provider: OwnershipDataProviderInterface)
}
