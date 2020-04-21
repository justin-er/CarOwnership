//
//  OwnershipPresenter.swift
//  AEFetchedResultsControllerApp
//
//  Created by Amirreza Eghtedari on 21.04.20.
//  Copyright © 2020 Amirreza Eghtedari. All rights reserved.
//

import Foundation

class OwnershipPresenter : OwnershipPresenterInterface {
    
    var dataProvider: OwnershipDataProviderInterface?
    weak var delegate: OwnershipPresenterDelegate?
    
    var objects: [OwnershipViewModel]? {
        
        guard let objects = self.dataProvider?.objects else {
            return nil
        }
        
        return objects.map { ownership in
            return OwnershipViewModel(ownerhsip: ownership)
        }
    }
    
    func object(at indexPath: IndexPath) -> OwnershipViewModel {
        guard let dataProvider = self.dataProvider else {
            fatalError("There is no data provider")
        }
        
        let ownership = dataProvider.object(at: indexPath)
        return OwnershipViewModel(ownerhsip: ownership)
    }
    
    var sctionIndexTitles: [String] {
        guard let dataProvider = self.dataProvider else {
            fatalError("There is no data provider")
        }
        
        return dataProvider.sectionIndexTitles
    }
    
    var sectionsCount: Int? {
        return dataProvider?.sectionsCount
    }
    
    func section(forSectionIndexTitle title: String, at sectionIndex: Int) -> Int {
        guard let dataProvider = self.dataProvider else {
            fatalError("There is no data provider")
        }
        
        return dataProvider.section(forSectionIndexTitle: title, at: sectionIndex)
    }
    
    func sectionIndexTitle(forSectionName sectionName: String) -> String? {
        return dataProvider?.sectionIndexTitle(forSectionName: sectionName)
    }
    
    func relaodData() {
        dataProvider?.relaodData()
    }
    
    func deleteObject(at indexPath: IndexPath) {
        dataProvider?.deleteObject(at: indexPath)
    }
    
    func addSomething() {
        dataProvider?.addSomething()
    }
    
    func saveSomething() {
        dataProvider?.saveSomething()
    }
}

extension OwnershipPresenter: OwnershipDataProviderDelegate {
    
    func providerDidReloadData(_ provider: OwnershipDataProviderInterface) {
        delegate?.presenterDidReloadData(self)
    }
    
    func providerDidFilterData(_ provider: OwnershipDataProviderInterface) {
        delegate?.presenterDidFilterData(self)
    }
    
    func providerWillChangeContent(_ provider: OwnershipDataProviderInterface) {
        delegate?.presenterWillChangeContent(self)
    }
    
    func provider(_ provider: OwnershipDataProviderInterface, didChange anObject: Ownership, at indexPath: IndexPath?, for type: AEModelChangeType, newIndexPath: IndexPath?) {
        
        let ownershipViewModel = OwnershipViewModel(ownerhsip: anObject)
        delegate?.presenter(self, didChange: ownershipViewModel, at: indexPath, for: type, newIndexPath: newIndexPath)
    }
    
    func providerDidChangeSection(_ provider: OwnershipDataProviderInterface, at sectionIndex: Int, for type: AEModelChangeType) {
        
        delegate?.presenterDidChangeSection(self, at: sectionIndex, for: type)
    }
    
    func providerDidChangeContent(_ provider: OwnershipDataProviderInterface) {
        delegate?.presenterDidChangeContent(self)
    }
}
