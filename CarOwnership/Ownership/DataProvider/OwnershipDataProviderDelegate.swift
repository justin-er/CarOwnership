//
//  DBProviderDelegate.swift
//  AEFetchedResultsControllerApp
//
//  Created by Amirreza Eghtedari on 16.04.20.
//  Copyright © 2020 Amirreza Eghtedari. All rights reserved.
//

import Foundation

protocol OwnershipDataProviderDelegate: class {
    
    func providerDidReloadData(_ provider: OwnershipDataProviderInput)
    
    func providerDidFilterData(_ provider: OwnershipDataProviderInput)
    
    func providerWillChangeContent(_ provider: OwnershipDataProviderInput)
    
    func provider(_ provider: OwnershipDataProviderInput, didChange ownership: Ownership?, at indexPath: IndexPath?, for type: AEModelChangeType, newIndexPath: IndexPath?)
    
    func providerDidChangeSection(_ provider: OwnershipDataProviderInput, at sectionIndex: Int, for type: AEModelChangeType)
    
    func providerDidChangeContent(_ provider: OwnershipDataProviderInput)
}
