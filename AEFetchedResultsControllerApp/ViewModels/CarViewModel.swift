//
//  CarViewModel.swift
//  AEFetchedResultsControllerApp
//
//  Created by Amirreza Eghtedari on 21.04.20.
//  Copyright © 2020 Amirreza Eghtedari. All rights reserved.
//

import Foundation

struct CarViewModel {
    var model:      String
    var mileage:    Int
    var manufacturer: ManufacturerViewModel
    
    init(by car: Car) {
        self.model =    car.model
        self.mileage =  car.mileage
        self.manufacturer = ManufacturerViewModel.init(by: car.manufacturer)
    }
    
    func makeCar() -> Car {
        let manufacturer = self.manufacturer.makeManufacturer()
        let car = Car(model: self.model,
                      mileage: self.mileage,
                      manufacturer: manufacturer)
        return car
    }
    
    func update(car: inout Car) {
        car.mileage     = self.mileage
        car.model       = self.model
        self.manufacturer.update(manufacturer: &car.manufacturer)
    }
    
}
