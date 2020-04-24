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
    
    static func makeModule(carObjectID: URL) -> EditMileageViewController {
        
        let storyboard = UIStoryboard(name: "EditMileage", bundle: nil)
        let editMileageViewController = storyboard.instantiateViewController(identifier: "EditMileageViewController") as! EditMileageViewController
        editMileageViewController.carObjectID = carObjectID
        
        let presenter = EditMileagePresenter()
        let dataProvider = EditMileageDataProvider()
        
        editMileageViewController.presenter = presenter
        presenter.dataProvider = dataProvider
        
        return editMileageViewController
    }
}
