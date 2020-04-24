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
    
    let birthdateFormat = "dd LL yyyy"
    
    var objects: [OwnershipViewModel]? {
        
        guard let objects = self.dataProvider?.objects else {
            return nil
        }
        
        return objects.map { ownership in
            return OwnershipViewModel(by: ownership, dateFormat: birthdateFormat)
        }
    }
    
    func object(at indexPath: IndexPath) -> OwnershipViewModel {
        guard let dataProvider = self.dataProvider else {
            fatalError("There is no data provider")
        }
        
        let ownership = dataProvider.object(at: indexPath)
        return OwnershipViewModel(by: ownership, dateFormat: birthdateFormat)
    }
    
    func objectUrl(at indexPath: IndexPath) -> (ownerUrl: URL?, carUrl: URL?, manufacturerUrl: URL?) {
        guard let dataProvider = self.dataProvider else {
            return (nil, nil, nil)
        }
        
        return dataProvider.objectUrl(at: indexPath)
    }
    
    var sctionIndexTitles: [String] {
        guard let dataProvider = self.dataProvider else {
            fatalError("There is no data provider")
        }
        
        return dataProvider.sectionIndexTitles
    }
    
    var numberOfSections: Int? {
        return dataProvider?.numberOfSections
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
    
    func numberOfRowsInSection(at index: Int) -> Int {
        guard let dataProvider = dataProvider else { return 0 }
        return dataProvider.numberOfRowsInSection(at: index)
    }
    
    func sectionName(at index: Int) -> String? {
        return dataProvider?.sectionName(at: index)
    }
    
    func relaodData() {
        dataProvider?.relaodData()
    }
    
    func deleteObject(at indexPath: IndexPath) {
        dataProvider?.deleteObject(at: indexPath)
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
    
    func provider(_ provider: OwnershipDataProviderInterface, didChange ownership: Ownership?, at indexPath: IndexPath?, for type: AEModelChangeType, newIndexPath: IndexPath?) {
        
        var ownershipViewModel: OwnershipViewModel? = nil
        if let ownership = ownership {
            ownershipViewModel = OwnershipViewModel(by: ownership, dateFormat: birthdateFormat)
        }
        
        delegate?.presenter(self, didChange: ownershipViewModel, at: indexPath, for: type, newIndexPath: newIndexPath)
    }
    
    func providerDidChangeSection(_ provider: OwnershipDataProviderInterface, at sectionIndex: Int, for type: AEModelChangeType) {
        
        delegate?.presenterDidChangeSection(self, at: sectionIndex, for: type)
    }
    
    func providerDidChangeContent(_ provider: OwnershipDataProviderInterface) {
        delegate?.presenterDidChangeContent(self)
    }
}
