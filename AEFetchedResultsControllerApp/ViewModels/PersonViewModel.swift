//
//  PersonViewModel.swift
//  AEFetchedResultsControllerApp
//
//  Created by Amirreza Eghtedari on 21.04.20.
//  Copyright © 2020 Amirreza Eghtedari. All rights reserved.
//

import Foundation

struct PersonViewModel {
    var birthdate:  String
    var name:       String
    
    private var dateFormatter = DateFormatter()
    
    init(by person: Person, dateFormat: String) {
        self.dateFormatter.dateFormat = dateFormat
        self.birthdate =    dateFormatter.string(from: person.birthdate)
        self.name =         person.name
    }
    
    func makePerson() -> Person {
        let birthdate = dateFormatter.date(from: self.birthdate)
        let person = Person(birthdate: birthdate!, name: self.name)
        
        return person
    }
    
    func update(person: inout Person) throws {
        
        guard let birthdate     = dateFormatter.date(from: self.birthdate) else {
            throw ViewModelError.invalidDate
        }
        person.birthdate        = birthdate
        person.name             = self.name
    }
}
