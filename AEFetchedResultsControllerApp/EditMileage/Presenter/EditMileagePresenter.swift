//
//  EditMileagePresenter.swift
//  AEFetchedResultsControllerApp
//
//  Created by Amirreza Eghtedari on 24.04.20.
//  Copyright © 2020 Amirreza Eghtedari. All rights reserved.
//

import Foundation

class EditMileagePresenter: EditMileagePresenterInterface {
    
    var dataProvider: EditMileageDataProviderInterface?
    
    func object(by url: URL) -> CarViewModel? {
        guard let car = dataProvider?.object(by: url) else {
            return nil
        }
        
        return CarViewModel(by: car)
    }
    
    func updateObject(with url: URL, by car: CarViewModel) {
        dataProvider?.updateObject(with: url, by: car.makeCar())
    }
}
