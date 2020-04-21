//
//  DBProviderDelegate.swift
//  AEFetchedResultsControllerApp
//
//  Created by Amirreza Eghtedari on 16.04.20.
//  Copyright © 2020 Amirreza Eghtedari. All rights reserved.
//

import Foundation

protocol DBProviderDelegate: class {
    
    func providerDidReloadData<Provider: DBProviderInterface>(_ provider: Provider)
    
    func providerDidFilterData<Provider: DBProviderInterface>(_ provider: Provider)
    
    func provider<Provider: AEListModelProvider>(_ provider: Provider, didChangeModels changeEvent: AEModelEvent<Ownership>)
    
    func provider1<Provider: AEListModelProvider>(_ provider: Provider, didChangeSections changeEvent: AESectionInfoEvent)
}
