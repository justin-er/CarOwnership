//
//  OwnershipPresenterDelegate.swift
//  AEFetchedResultsControllerApp
//
//  Created by Amirreza Eghtedari on 21.04.20.
//  Copyright © 2020 Amirreza Eghtedari. All rights reserved.
//

import Foundation

protocol OwnershipPresenterDelegate: class {
    
    func presenterDidReloadData<Presenter: OwnershipPresenterInterface>(_ provider: Presenter)
    
    func presenterDidFilterData<Presenter: OwnershipPresenterInterface>(_ provider: Presenter)
    
    func presenter<Presenter: OwnershipPresenterInterface>(_ provider: Presenter, didChangeModels changeEvent: AEModelEvent<OwnershipViewModel>)
    
    func presenter<Presenter: OwnershipPresenterInterface>(_ provider: Presenter, didChangeSections changeEvent: AESectionInfoEvent)
}
