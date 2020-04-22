//
//  TableViewController.swift
//  AEFetchedResultsControllerApp
//
//  Created by Amirreza Eghtedari on 14.04.20.
//  Copyright © 2020 Amirreza Eghtedari. All rights reserved.
//

import UIKit
import CoreData

class OwnershipTableViewController: UITableViewController {

    var presenter: OwnershipPresenterInterface?
    
    var addButtonItem: UIBarButtonItem!
    var saveButtonItem: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.leftBarButtonItem = self.editButtonItem
        
        addButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addSomething))
        self.navigationItem.rightBarButtonItem = self.addButtonItem
        
        saveButtonItem = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(saveSomething))
        self.navigationItem.rightBarButtonItems?.append(contentsOf: [saveButtonItem])
    }
    
    @objc func addSomething() {
        presenter?.addSomething()
    }
    
    @objc func saveSomething() {
        presenter?.saveSomething()
    }

    override func viewDidAppear(_ animated: Bool) {
        presenter?.relaodData()
    }
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return presenter?.numberOfSections ?? 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let presenter = self.presenter else { return 0 }
        return presenter.numberOfRowsInSection(at: section)
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CarOwnerCell", for: indexPath) as! CarOwnerCell

        guard let presenter = self.presenter else {
            return cell
        }
        
        let ownership = presenter.object(at: indexPath)
        cell.car.text = ownership.car.model
        cell.manufacturer.text = ownership.manufacturer.name
        cell.mileage.text = "\(ownership.car.mileage)"

        return cell
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return presenter?.sectionName(at: section)
    }

    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        guard editingStyle == .delete else { return }
        
        presenter?.deleteObject(at: indexPath)
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}

//MARK:- OwnershipPresenterDelegate
extension OwnershipTableViewController: OwnershipPresenterDelegate {
    
    func presenterDidReloadData(_ presenter: OwnershipPresenterInterface) {
        tableView.reloadData()
    }
    
    func presenterDidFilterData(_ presenter: OwnershipPresenterInterface) {
        tableView.reloadData()
    }
    
    func presenterWillChangeContent(_ presenter: OwnershipPresenterInterface) {
        tableView.beginUpdates()
    }
    
    func presenter(_ presenter: OwnershipPresenterInterface, didChange ownership: OwnershipViewModel?, at indexPath: IndexPath?, for type: AEModelChangeType, newIndexPath: IndexPath?) {
        
        switch type {
        case .delete:
            tableView.deleteRows(at: [indexPath!], with: .automatic)
        case .insert:
            tableView.insertRows(at: [newIndexPath!], with: .automatic)
        case .update:
            tableView.reloadRows(at: [indexPath!], with: .automatic)
        case .move:
            tableView.moveRow(at: indexPath!, to: newIndexPath!)
        }
    }
    
    func presenterDidChangeSection(_ presenter: OwnershipPresenterInterface, at sectionIndex: Int, for type: AEModelChangeType) {
        
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
    
    func presenterDidChangeContent(_ presenter: OwnershipPresenterInterface) {
        tableView.endUpdates()
    }
    
    
}
