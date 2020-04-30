//
//  EditMileagePresenter.swift
//  AEFetchedResultsControllerApp
//
//  Created by Amirreza Eghtedari on 24.04.20.
//  Copyright © 2020 Amirreza Eghtedari. All rights reserved.
//

import Foundation

class EditMileageInteractor: EditMileageInteractorInput {

	var presenter: EditMileagePresenterInput?
    var dataProvider: EditMileageDataProviderInput?
	
	func getCar(with modelID: String)  {
		guard let car = dataProvider?.getCar(by: modelID) else {
            return
        }
        
		presenter?.didGet(self, car: car)
	}
	
	func updateCar(with modelID: String, by car: CarViewModel) {
		dataProvider?.updateObject(with: modelID, by: car.makeCar())
	}
}

extension EditMileageInteractor: EditMileageDataProviderDelegate {
	
}
