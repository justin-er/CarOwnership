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
    
    init(car: Car) {
        self.model =    car.model
        self.mileage =  car.mileage
    }
    
    func makeCar() -> Car {
        let car = Car(model: self.model,
                      mileage: self.mileage)
        return car
    }
    
}
