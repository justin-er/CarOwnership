//
//  DBProvider02.swift
//  AEFetchedResultsControllerApp
//
//  Created by Amirreza Eghtedari on 17.04.20.
//  Copyright © 2020 Amirreza Eghtedari. All rights reserved.
//

import Foundation
import CoreData

class OwnershipDataProvider: NSObject {
    
    var frc: NSFetchedResultsController<ManagedCar>!
    weak var delegate: OwnershipDataProviderDelegate?
    
    var modelEvent:          AEModelEvent<Ownership>? = nil
    var sectionInfoEvent:    AESectionInfoEvent? = nil
    
    override init() {
        
        super.init()
        
        NotificationCenter.default.addObserver(self,
                         selector: #selector(accountsUpdated(notification:)),
                         name: NSNotification.Name.NSManagedObjectContextDidSave,
                         object: DBManager.shared.context)

        
        let fetchRequest: NSFetchRequest<ManagedCar> = ManagedCar.fetchRequest()
        let predicate = NSPredicate(format: "owner != nil && manufacturer != nil")
        fetchRequest.predicate = predicate
        let sort1 = NSSortDescriptor(key: #keyPath(ManagedCar.owner.name), ascending: true)
        let sort2 = NSSortDescriptor(key: #keyPath(ManagedCar.model), ascending: true)
        fetchRequest.sortDescriptors = [sort1, sort2]
        
        frc = NSFetchedResultsController(fetchRequest: fetchRequest,
                                         managedObjectContext: DBManager.shared.context,
                                         sectionNameKeyPath: #keyPath(ManagedCar.owner.name),
                                         cacheName: nil)
        frc.delegate = self
    }
    
    @objc func accountsUpdated(notification: NSNotification) {
        if let userInfo = notification.userInfo {
            //InsertedObject
            if let insertedObjects = userInfo[NSInsertedObjectsKey] as? Set<NSManagedObject>,  insertedObjects.count > 0 {
                
            }
            
            //DeletedObjects
            if let deletedObjects = userInfo[NSDeletedObjectsKey] as? Set<NSManagedObject>,  deletedObjects.count > 0 {
                
            }
            
            //UpdatedObjects
            if let updatedObjects = userInfo[NSUpdatedObjectsKey] as? Set<NSManagedObject>,  updatedObjects.count > 0 {
                
            }
        }
    }
}

extension OwnershipDataProvider: OwnershipDataProviderInterface {
    
    func relaodData() {
        do {
            try frc.performFetch()
            if frc.fetchedObjects?.count == 0 {
                initializeDatabase()
            } else {
                delegate?.providerDidReloadData(self)
            }
        } catch {
            let nserror = error as NSError
            fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
        }
    }
    
    func initializeDatabase() {
        print(frc.sections!.count)
        guard frc.sections?.count == 0 else { return }
        
        //Manufacturer
        let kia =       ManagedManufacturer(contex: DBManager.shared.context, name: "Kia", ranking: 12)
        let toyota =    ManagedManufacturer(contex: DBManager.shared.context, name: "Toyota", ranking: 5)
        let porche =    ManagedManufacturer(contex: DBManager.shared.context, name: "Porche", ranking: 11)
        let bmw =       ManagedManufacturer(contex: DBManager.shared.context, name: "BMW", ranking: 7)
        
        let calendar =  Calendar.current
        
        //Amir
        let amirDate =  calendar.date(from: DateComponents(calendar: calendar, year: 1978, month: 11, day: 12))
        let amir =      ManagedPerson(context: DBManager.shared.context, name: "Amirreza", birthdate: amirDate!, cars: nil)
        let _ =         ManagedCar(contex: DBManager.shared.context, model: "Picanto", manufacturer: kia, mileage: 32000, owner: amir)
        let _ =         ManagedCar(contex: DBManager.shared.context, model: "Corrola", manufacturer: toyota, mileage: 800, owner: amir)
        
        //Nima
        let nimaDate =  calendar.date(from: DateComponents(calendar: calendar, year: 1982, month: 6, day: 1))
        let nima =      ManagedPerson(context: DBManager.shared.context, name: "Nima", birthdate: nimaDate!, cars: nil)
        let _ =         ManagedCar(contex: DBManager.shared.context, model: "Picanto", manufacturer: kia, mileage: 32000, owner: nima)
        let _ =         ManagedCar(contex: DBManager.shared.context, model: "Corrola", manufacturer: toyota, mileage: 800, owner: nima)
        
        //David
        let davidDate =     calendar.date(from: DateComponents(calendar: calendar, year: 1973, month: 1, day: 22))
        let _911Turbo =     ManagedCar(contex: DBManager.shared.context, model: "911 Turbo", manufacturer: porche, mileage: 256000, owner: nil)
        let _328 =          ManagedCar(contex: DBManager.shared.context, model: "328 M3", manufacturer: bmw, mileage: 22000, owner: nil)
        let _ =             ManagedPerson(context: DBManager.shared.context, name: "David", birthdate: davidDate!, cars: [_911Turbo, _328])
        
        DBManager.shared.saveContext()
    }
    
    func addSomething() {
        let firstCar = frc.object(at: IndexPath(row: 0, section: 0)) as ManagedCar
        let owner = firstCar.owner!
        let mercedes = ManagedManufacturer(contex: DBManager.shared.context, name: "Mercedes", ranking: 3)
        let _ = ManagedCar(contex: DBManager.shared.context, model: "A 250", manufacturer: mercedes, mileage: 45, owner: owner)
    }
    
    func saveSomething() {
        DBManager.shared.saveContext()
    }
    
    func deleteObject(at indexPath: IndexPath) {
        
        let car = frc.object(at: indexPath)
        DBManager.shared.context.delete(car)
        DBManager.shared.saveContext()
    }
}

extension OwnershipDataProvider: AEListModelProvider {
    
    typealias Model = Ownership
    
    var objects: [Ownership]? {
        guard let objects = frc.fetchedObjects else {
            return nil
        }
        
        return objects.map { managedCar in
            return Ownership(person: managedCar.owner!.person,
                             car: managedCar.car,
                             manufacturer: managedCar.manufacturer!.manufacturer)
        }
    }
    
    var sectionsCount: Int? {
        return frc.sections?.count
    }
    
    var sctionIndexTitles: [String] {
        return frc.sectionIndexTitles
    }
    
    func section(forSectionIndexTitle title: String, at sectionIndex: Int) -> Int {
        return frc.section(forSectionIndexTitle: title, at: sectionIndex)
    }
    
    func sectionIndexTitle(forSectionName sectionName: String) -> String? {
        return frc.sectionIndexTitle(forSectionName: sectionName)
    }
    
    func object(at indexPath: IndexPath) -> Ownership {
        let managedCar = frc.object(at: indexPath)
        let ownership = Ownership(person: managedCar.owner!.person,
                                  car: managedCar.car,
                                  manufacturer: managedCar.manufacturer!.manufacturer)
        return ownership
    }
}

extension OwnershipDataProvider: NSFetchedResultsControllerDelegate {
    
    func controllerWillChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        modelEvent =        AEModelEvent()
        sectionInfoEvent =   AESectionInfoEvent()
    }
    
    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange anObject: Any, at indexPath: IndexPath?, for type: NSFetchedResultsChangeType, newIndexPath: IndexPath?) {
        
        let managedCar = anObject as! ManagedCar
        let ownership = Ownership(person: managedCar.owner!.person,
                                  car: managedCar.car,
                                  manufacturer: managedCar.manufacturer!.manufacturer)
        
        switch type {
        case .insert:
            let event = AEModelChange<Ownership>(model: ownership, indexPath: newIndexPath!)
            modelEvent?.didInsertModels.append(event)
            
        case .update:
            let event = AEModelChange<Ownership>(model: ownership, indexPath: indexPath!)
            modelEvent?.didUpdateModels.append(event)
            
        case .delete:
            let event = AEModelChange<Ownership>(model: ownership, indexPath: indexPath!)
            modelEvent?.didDeleteModels.append(event)
            
        case .move:
            let event = AEModelMove<Ownership>(model: ownership, indexPath: indexPath!, newIndexPath: newIndexPath!)
            modelEvent?.didMoveModels.append(event)
            
        default:
            break
            
        }
    }
    
    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange sectionInfo: NSFetchedResultsSectionInfo, atSectionIndex sectionIndex: Int, for type: NSFetchedResultsChangeType) {
    
        switch type {
        case .insert:
            let event = AESectionInfoChange(index: sectionIndex)
            sectionInfoEvent?.didInsertSections.append(event)
            
        case .update:
            let event = AESectionInfoChange(index: sectionIndex)
            sectionInfoEvent?.didUpdateSections.append(event)
            
        case .delete:
            let event = AESectionInfoChange(index: sectionIndex)
            sectionInfoEvent?.didDeleteSections.append(event)
            
        case .move:
            print("I don't know what do with section movement at the moment!")
            
        default:
            break
            
        }
    }
    
    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        
        if let modelEvent = self.modelEvent {
            delegate?.provider(self, didChangeModels: modelEvent)
            self.modelEvent = nil
        }
        
        if let sectionInfoEvent = self.sectionInfoEvent {
            delegate?.provider1(self, didChangeSections: sectionInfoEvent)
            self.sectionInfoEvent = nil
        }
    }
}
