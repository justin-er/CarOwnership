//
//  TableViewController.swift
//  AEFetchedResultsControllerApp
//
//  Created by Amirreza Eghtedari on 14.04.20.
//  Copyright © 2020 Amirreza Eghtedari. All rights reserved.
//

import UIKit
import CoreData

class TableViewController: UITableViewController {

    var dataProvider: DBProvider02Interface!
    var frc: NSFetchedResultsController<ManagedCar>?
    var addButtonItem: UIBarButtonItem!
    var saveButtonItem: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.leftBarButtonItem = self.editButtonItem
        
        addButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addSomething))
        self.navigationItem.rightBarButtonItem = self.addButtonItem
        
        saveButtonItem = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(saveSomething))
        self.navigationItem.rightBarButtonItems?.append(contentsOf: [saveButtonItem])
        
        let dbp = DBProvider02()
        dataProvider = dbp as DBProvider02Interface
        dbp.delegate = self
    }
    
    @objc func addSomething() {
        dataProvider.addSomething()
    }
    
    @objc func saveSomething() {
        dataProvider.saveSomething()
    }

    override func viewDidAppear(_ animated: Bool) {
        dataProvider.relaodData()
    }
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return frc?.sections?.count ?? 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let sections = frc?.sections else {
            return 0
        }
        let section = sections[section]
        return section.numberOfObjects
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CarOwnerCell", for: indexPath) as! CarOwnerCell

        guard let frc = self.frc else {
            return cell
        }
        let car = frc.object(at: indexPath)
        cell.car.text = car.model
        cell.manufacturer.text = car.manufacturer?.name
        cell.mileage.text = "\(car.mileage)"

        return cell
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return frc?.sections?[section].name
    }

    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        guard editingStyle == .delete else { return }
        
        dataProvider.deleteObject(at: indexPath)
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let object = frc?.object(at: indexPath)
        print(object?.objectID.uriRepresentation())
    }
}

extension TableViewController: DBProvider02Delegate {
    
    func providerDidReloadData(_ provider: DBProvider02Interface, frc: NSFetchedResultsController<ManagedCar>) {
        
        self.frc = frc
        tableView.reloadData()
    }
    
    func providerWillChangeContent(_ provider: DBProvider02Interface, frc: NSFetchedResultsController<ManagedCar>) {
        
        self.frc = frc
        tableView.beginUpdates()
    }
    
    func provider(_ provider: DBProvider02Interface, frc: NSFetchedResultsController<ManagedCar>, didChange anObject: Any, at indexPath: IndexPath?, for type: NSFetchedResultsChangeType, newIndexPath: IndexPath?) {
        
        self.frc = frc
        switch type {
        case .delete:
            tableView.deleteRows(at: [indexPath!], with: .automatic)
        case .insert:
            tableView.insertRows(at: [newIndexPath!], with: .automatic)
        case .update:
            tableView.reloadRows(at: [indexPath!], with: .automatic)
        default:
            break
        }
    }
    
    func provider(_ provider: DBProvider02Interface, frc: NSFetchedResultsController<ManagedCar>, didChange sectionInfo: NSFetchedResultsSectionInfo, atSectionIndex sectionIndex: Int, for type: NSFetchedResultsChangeType) {
        
        self.frc = frc
        switch type {
        case .update:
            tableView.reloadSections(IndexSet([sectionIndex]), with: .automatic)
        case .delete:
            tableView.deleteSections(IndexSet([sectionIndex]), with: .automatic)
        case .insert:
            tableView.insertSections(IndexSet([sectionIndex]), with: .automatic)
        default:
            break
        }
    }
    
    func providerDidChangeContent(_ provider: DBProvider02Interface, frc: NSFetchedResultsController<ManagedCar>) {
        
        self.frc = frc
        tableView.endUpdates()
    }
}
