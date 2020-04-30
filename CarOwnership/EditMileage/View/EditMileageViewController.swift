//
//  EditMileageViewController.swift
//  AEFetchedResultsControllerApp
//
//  Created by Amirreza Eghtedari on 24.04.20.
//  Copyright © 2020 Amirreza Eghtedari. All rights reserved.
//

import UIKit

class EditMileageViewController: UIViewController {

	var carModelID: String!
	var car: CarViewModel?
	var interactor: EditMileageInteractorInput?
    var saveButton: UIBarButtonItem!
    
    @IBOutlet weak var manufacturerLabel: UILabel!
    @IBOutlet weak var modelLabel: UILabel!
    @IBOutlet weak var mileageTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mileageTextField.delegate = self
        
        saveButton = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(saveButtonTapped))
        self.navigationItem.rightBarButtonItem = saveButton
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        interactor?.getCar(with: carModelID)
    }
    
    @objc func saveButtonTapped() {
        if let mileageString = mileageTextField.text, let mileage = Int(mileageString) {
            car?.mileage = mileage
            interactor?.updateCar(with: carModelID, by: car!)
            self.navigationController?.popViewController(animated: true)
        }
    }
}

extension EditMileageViewController: EditMileagePresenterDelegate {
	
	func didGet(_ presenter: EditMileagePresenterInput, car: CarViewModel) {
		self.car = car
		manufacturerLabel.text = car.manufacturer.name
		modelLabel.text = car.model
		mileageTextField.text = "\(car.mileage)"
	}
}

extension EditMileageViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if let mileageString = textField.text, let mileage = Int(mileageString) {
            car?.mileage = mileage
            interactor?.updateCar(with: carModelID, by: car!)
            textField.resignFirstResponder()
            self.navigationController?.popViewController(animated: true)
            return true
        }
        return false
    }
}


