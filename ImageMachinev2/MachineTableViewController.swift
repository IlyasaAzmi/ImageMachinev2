//
//  MachineTableViewController.swift
//  ImageMachinev2
//
//  Created by Ilyasa Azmi on 12/03/20.
//  Copyright © 2020 Ilyasa Azmi. All rights reserved.
//

import UIKit
import os.log

class MachineTableViewController: UITableViewController {
    
    //MARK: Properties
    var machines = [Machine]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        
        // Use the edit button item provided by the table view controller.
        navigationItem.leftBarButtonItem = editButtonItem
        
        // Load the sample data.
        loadSampleMachines()
        
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return machines.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Table view cells are reused and should be dequeued using a cell identifier.
        let cellIdentifier = "MachineTableViewCell"
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? MachineTableViewCell  else {
            fatalError("The dequeued cell is not an instance of MealTableViewCell.")
        }
        
        let machine = machines[indexPath.row]
        
        cell.nameLabel.text = machine.name
        cell.photoImageView.image = machine.photo
        
        // Configure the cell...
        
        return cell
    }
    
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            machines.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
    }
    
    /*
     // Override to support rearranging the table view.
     override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
     
     }
     */
    
    /*
     // Override to support conditional rearranging of the table view.
     override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the item to be re-orderable.
     return true
     }
     */
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        switch(segue.identifier ?? "") {
        case "AddMachine":
            os_log("Adding a new machine.", log: OSLog.default, type: .debug)
            
        case "ShowDetail":
            guard let machineDetailViewController = segue.destination as? MachineViewController else {
                fatalError("Unexpected destination: \(segue.destination)")
            }
            
            guard let selectedMachineCell = sender as? MachineTableViewCell else {
                fatalError("Unexpected sender: \(sender)")
            }
            
            guard let indexPath = tableView.indexPath(for: selectedMachineCell) else {
                fatalError("The selected cell is not being displayed by the table")
            }
            
            let selectedMachine = machines[indexPath.row]
            machineDetailViewController.machine = selectedMachine
            
        case "CameraScan":
            os_log("Scan QR Code.", log: OSLog.default, type: .debug)
            
        default:
            fatalError("Unexpected Segue Identifier; \(segue.identifier)")
            
        }
    }
    
    //MARK: Actions
    
    @IBAction func unwindToMealList(sender: UIStoryboardSegue) {
        if let sourceViewController = sender.source as? MachineViewController, let machine = sourceViewController.machine {
            
            if let selectedIndexPath = tableView.indexPathForSelectedRow {
                // Update an existing meal.
                machines[selectedIndexPath.row] = machine
                tableView.reloadRows(at: [selectedIndexPath], with: .none)
            } else {
                // Add a new meal.
                let newIndexPath = IndexPath(row: machines.count, section: 0)
                machines.append(machine)
                
                tableView.insertRows(at: [newIndexPath], with: .automatic)
            }
        }
    }
    
    
    //MARK: Private Methods
    
    private func loadSampleMachines() {
        let photo1 = UIImage(named: "default")
        let photo2 = UIImage(named: "default")
        let photo3 = UIImage(named: "default")
        
        guard let machine1 = Machine(name: "Machine 1", photo: photo1, type: "Portrait", qrcode: 123456, date: Date() ) else {
            fatalError("Unable to instantiate machine1")
        }
        guard let machine2 = Machine(name: "Mcahine 2", photo: photo2, type: "Portrait", qrcode: 234567, date: Date() ) else {
            fatalError("Unable to instantiate machine1")
        }
        guard let machine3 = Machine(name: "Machine 3", photo: photo3, type: "General", qrcode: 3456678, date: Date() ) else {
            fatalError("Unable to instantiate machine1")
        }
        
        machines += [machine1, machine2, machine3]
    }
    
}
