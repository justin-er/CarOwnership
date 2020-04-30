//
//  EditMileageComposer.swift
//  AEFetchedResultsControllerApp
//
//  Created by Amirreza Eghtedari on 24.04.20.
//  Copyright © 2020 Amirreza Eghtedari. All rights reserved.
//

import Foundation
import UIKit

class EditMileageComposer {
    
    static func makeModule(carModelID: String) -> EditMileageViewController {
        
        let storyboard = UIStoryboard(name: "EditMileage", bundle: nil)
        let editMileageViewController = storyboard.instantiateViewController(identifier: "EditMileageViewController") as! EditMileageViewController
        editMileageViewController.carModelID = carModelID
        
		let interactor = EditMileageInteractor()
        let presenter = EditMileagePresenter()
        let dataProvider = EditMileageDataProvider()
        
		editMileageViewController.interactor = interactor
		interactor.presenter = presenter as EditMileagePresenterInput
		interactor.dataProvider = dataProvider
		dataProvider.delegate = interactor as EditMileageDataProviderDelegate
		presenter.delegate = editMileageViewController as EditMileagePresenterDelegate
        
        return editMileageViewController
    }

	static func show(source: UIViewController, carModelID: String) {
        let editMileageViewController = makeModule(carModelID: carModelID)
        source.show(editMileageViewController, sender: nil)
    }
}
