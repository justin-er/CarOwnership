//
//  OwnershipPresenter.swift
//  AEFetchedResultsControllerApp
//
//  Created by Amirreza Eghtedari on 21.04.20.
//  Copyright © 2020 Amirreza Eghtedari. All rights reserved.
//

import Foundation

class OwnershipPresenter {
    
    private weak var dataSource: OwnershipDataSource?
    weak var delegate: OwnershipPresenterDelegate?
    
    let birthdateFormat = "dd LL yyyy"
}

extension OwnershipPresenter: OwnershipViewModelDataSource {
	
	var objects: [OwnershipViewModel]? {
        
        guard let objects = self.dataSource?.objects else {
            return nil
        }
        
        return objects.map { ownership in
            return OwnershipViewModel(by: ownership, dateFormat: birthdateFormat)
        }
    }
    
    func object(at indexPath: IndexPath) -> OwnershipViewModel {
        guard let dataProvider = self.dataSource else {
            fatalError("There is no data provider")
        }
        
        let ownership = dataProvider.object(at: indexPath)
        return OwnershipViewModel(by: ownership, dateFormat: birthdateFormat)
    }
    
    func objectModelId(at indexPath: IndexPath) -> (ownerModelId: String?, carModelId: String?, manufacturerModelId: String?) {
        guard let dataProvider = self.dataSource else {
            return (nil, nil, nil)
        }
        
        return dataProvider.objectModelId(at: indexPath)
		
    }
    
    var sctionIndexTitles: [String] {
        guard let dataProvider = self.dataSource else {
            fatalError("There is no data provider")
        }
        
        return dataProvider.sectionIndexTitles
    }
    
    var numberOfSections: Int? {
        return dataSource?.numberOfSections
    }
    
    func section(forSectionIndexTitle title: String, at sectionIndex: Int) -> Int {
        guard let dataProvider = self.dataSource else {
            fatalError("There is no data provider")
        }
        
        return dataProvider.section(forSectionIndexTitle: title, at: sectionIndex)
    }
    
    func sectionIndexTitle(forSectionName sectionName: String) -> String? {
        return dataSource?.sectionIndexTitle(forSectionName: sectionName)
    }
    
    func numberOfRowsInSection(at index: Int) -> Int {
        guard let dataProvider = dataSource else { return 0 }
        return dataProvider.numberOfRowsInSection(at: index)
    }
    
    func sectionName(at index: Int) -> String? {
        return dataSource?.sectionName(at: index)
    }
}

extension OwnershipPresenter: OwnershipPresenterInput {
	
	func interactorDidReloadData(_ interactor: OwnershipInteractorInput, source: OwnershipDataSource) {
		self.dataSource = source
        delegate?.presenterDidReloadData(self)
    }
    
    func interactorDidFilterData(_ interactor: OwnershipInteractorInput, source: OwnershipDataSource) {
        self.dataSource = source
		delegate?.presenterDidFilterData(self)
    }
    
	func interactorWillChangeContent(_ interactor: OwnershipInteractorInput, source: OwnershipDataSource) {
        self.dataSource = source
		delegate?.presenterWillChangeContent(self)
    }
    
    func interactor(_ interactor: OwnershipInteractorInput, source: OwnershipDataSource, didChange ownership: Ownership?, at indexPath: IndexPath?, for type: AEModelChangeType, newIndexPath: IndexPath?) {
        
		self.dataSource = source
        var ownershipViewModel: OwnershipViewModel? = nil
        if let ownership = ownership {
            ownershipViewModel = OwnershipViewModel(by: ownership, dateFormat: birthdateFormat)
        }
        
        delegate?.presenter(self, didChange: ownershipViewModel, at: indexPath, for: type, newIndexPath: newIndexPath)
    }
    
    func interactorDidChangeSection(_ interactor: OwnershipInteractorInput, source: OwnershipDataSource, at sectionIndex: Int, for type: AEModelChangeType) {
        self.dataSource = source
        delegate?.presenterDidChangeSection(self, at: sectionIndex, for: type)
    }
    
    func interactorDidChangeContent(_ interactor: OwnershipInteractorInput, source: OwnershipDataSource) {
        self.dataSource = source
		delegate?.presenterDidChangeContent(self)
    }
}
